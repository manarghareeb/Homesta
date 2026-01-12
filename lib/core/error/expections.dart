import 'package:dio/dio.dart';
import 'package:homesta/core/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: ErrorModel(errorMessage: "Time out"));
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errModel: ErrorModel(errorMessage: "send time out"),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errModel: ErrorModel(errorMessage: "receive time out"),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errModel: ErrorModel(errorMessage: "bad certificate"),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errModel: ErrorModel(errorMessage: 'Request was cancelled'),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errModel: ErrorModel(errorMessage: "No internet connection"),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errModel: ErrorModel(errorMessage: "Something went wrong"),
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
            errModel: ErrorModel(errorMessage: "Bad request"),
          );
        case 401: //unauthorized
          throw ServerException(
            errModel: ErrorModel(errorMessage:  ("unauthorized")),
          );
        case 403: //forbidden
          throw ServerException(
            errModel: ErrorModel(errorMessage:  ("forbidden")),
          );
        case 404: //not found
          throw ServerException(
            errModel: ErrorModel(errorMessage: ("not found")),
          );
        case 409: //cofficient
          throw ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 422: //  Unprocessable Entity
          throw ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 504: // Server exception
          throw ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 302: // Server exception
          throw ServerException(
            errModel: ErrorModel(errorMessage: ("302 exception")),
          );
      }
  }
}
