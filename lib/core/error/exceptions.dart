import 'package:equatable/equatable.dart';

class Exceptions extends Equatable implements Exception {
  final String message;

  const Exceptions({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ServerException extends Exceptions {
  const ServerException({
    required super.message,
  });
}

class OfflineException extends Exceptions {
  const OfflineException({
    required super.message,
  });
}
