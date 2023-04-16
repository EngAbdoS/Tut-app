import 'package:dio/dio.dart';
import 'package:flu_proj/data/network/failure.dart';
import 'package:flu_proj/presentation/resourses/strings_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handelError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handelError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioErrorType.receiveTimeout:
      return DataSource.RECIVED_TIMEOUT.getFailure();

    case DioErrorType.badCertificate: ///////////////////////////////////??????
    // TODO: Handle this case.

    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            error.response!.statusMessage!, error.response!.statusCode!);
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioErrorType.connectionError:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioErrorType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTANT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIVED_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponceMessage.SUCCESS, ResponceCode.SUCCESS);
        break;
      case DataSource.NO_CONTANT:
        return Failure(ResponceMessage.NO_CONTANT, ResponceCode.NO_CONTANT);
        break;

      case DataSource.BAD_REQUEST:
        return Failure(ResponceMessage.BAD_REQUEST, ResponceCode.BAD_REQUEST);
        break;

      case DataSource.FORBIDDEN:
        return Failure(ResponceMessage.FORBIDDEN, ResponceCode.FORBIDDEN);
        break;

      case DataSource.UNAUTHORISED:
        return Failure(ResponceMessage.UNAUTHORISED, ResponceCode.UNAUTHORISED);
        break;

      case DataSource.NOT_FOUND:
        return Failure(ResponceMessage.NOT_FOUND, ResponceCode.NOT_FOUND);
        break;

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponceMessage.INTERNAL_SERVER_ERROR,
            ResponceCode.INTERNAL_SERVER_ERROR);
        break;

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponceMessage.CONNECT_TIMEOUT, ResponceCode.CONNECT_TIMEOUT);
        break;

      case DataSource.CANCEL:
        return Failure(ResponceMessage.CANCEL, ResponceCode.CANCEL);
        break;

      case DataSource.RECIVED_TIMEOUT:
        return Failure(
            ResponceMessage.RECIVED_TIMEOUT, ResponceCode.RECIVED_TIMEOUT);
        break;

      case DataSource.SEND_TIMEOUT:
        return Failure(ResponceMessage.SEND_TIMEOUT, ResponceCode.SEND_TIMEOUT);
        break;

      case DataSource.CACHE_ERROR:
        return Failure(ResponceMessage.CACHE_ERROR, ResponceCode.CACHE_ERROR);
        break;

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponceMessage.NO_INTERNET_CONNECTION,
            ResponceCode.NO_INTERNET_CONNECTION);
        break;

      case DataSource.DEFAULT:
        return Failure(ResponceMessage.DEFAULT, ResponceCode.DEFAULT);
        break;
    }
  }
}

class ResponceCode {
  static const int SUCCESS = 200;
  static const int NO_CONTANT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  //local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIVED_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponceMessage {
  static const String SUCCESS = AppStrings.success;
  static const String NO_CONTANT = AppStrings.noContent;
  static const String BAD_REQUEST = AppStrings.badRequestError;
  static const String UNAUTHORISED =AppStrings.unauthorizedError;
  static const String FORBIDDEN = AppStrings.forbiddenError;
  static const String NOT_FOUND = AppStrings.notFoundError;
  static const String INTERNAL_SERVER_ERROR =AppStrings.internalServerError;
//      "Oops some thing went wrong , try again later";

  //local status code
  static const String CONNECT_TIMEOUT =AppStrings.timeoutError;
  static const String CANCEL = AppStrings.conflictError;
  static const String RECIVED_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR =AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String DEFAULT =AppStrings.defaultError;
}

class ApiInternalStatus
{
  static const int SUCCESS=0;
  static const int FAILURE=1;


}



