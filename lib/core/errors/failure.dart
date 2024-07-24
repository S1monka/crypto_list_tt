import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  @override
  List<Object?> get props => [message];

  const Failure({required this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: 'No Internet');
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: 'Server Failure');
}

class PlatformFailure extends Failure {
  const PlatformFailure() : super(message: 'Platform Failure');
}

class NotFound extends Failure {
  const NotFound() : super(message: "Not Found");
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
  });

  const UnknownFailure.initial()
      : super(
          message: 'Something Went Wrong',
        );
}
