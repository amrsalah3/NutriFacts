import 'package:nutrifacts/core/common/domain/entities/error_info.dart';

sealed class Result<T> {
  const Result._();

  factory Result.success(T data) = Success<T>;

  factory Result.failure(ErrorInfo errorInfo) = Failure<T>;
}

class Success<T> extends Result<T> {
  const Success(this.data) : super._();
  final T data;
}

class Failure<T> extends Result<T> {
  const Failure(this.errorInfo) : super._();
  final ErrorInfo errorInfo;
}
