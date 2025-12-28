import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/chat/data/models/chat_message_model.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo{
  final ApiConsumer apiConsumer;
  ChatRepoImpl({required this.apiConsumer});

  @override
  Future<ChatMessageModel> sendMessage(String message) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.chat,
        queryParameters: {ApiKey.message: message},
        data: {'language': 'ar'},
      );
      return ChatMessageModel.fromJson(response, message);
    } catch (e) {
      if (e is DioException) {
        handleDioExceptions(e);
      }
      rethrow;
    }
  }
}
