
import 'package:homesta/core/api/api_keys.dart';

class ErrorModel {
  final int ?status;
  final String errorMessage;

  ErrorModel({ this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status]??0,
      errorMessage: jsonData[ApiKeys.errorMessage]??"somesing went wrong",
    );
  }
}