import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  const Result({this.status = Status.loading, this.data, this.e});

  final Status status;
  final T? data;
  final Exception? e;

  static const loading = Result();

  Result copyWith({Status? status, T? data, Exception? e}) {
    return Result(
      status: status ?? this.status,
      data: data ?? this.data,
      e: e ?? this.e,
    );
  }

  @override
  List<Object?> get props => [status, data, e];
}

enum Status {
  loading,
  success,
  error;
}
