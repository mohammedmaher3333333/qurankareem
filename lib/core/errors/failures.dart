import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error, please try again!');
        default:
          return ServerFailure('Oops There was an error, please try later!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try later!');
    } else {
      return ServerFailure('Oops There was an error, please try later!');
    }
  }
}
