import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Server failures
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Sunucu hatası oluştu']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'İnternet bağlantısı yok']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Oturum süreniz doldu']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'İstenen kaynak bulunamadı']);
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure([super.message = 'Bu işlem için yetkiniz yok']);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure([super.message = 'Geçersiz istek']);
}

// Cache failures
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Önbellek hatası']);
}

// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

// General failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Beklenmeyen bir hata oluştu']);
}

// Timeout failures
class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'İstek zaman aşımına uğradı']);
}
