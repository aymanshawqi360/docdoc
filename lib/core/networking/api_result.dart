import 'package:docdoc/core/networking/api_error_model.dart';

abstract class ApiResult<T> {
  ApiResult();

  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(ApiErrorModel error) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  T data;
  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  ApiErrorModel error;
  Failure(this.error);
}
