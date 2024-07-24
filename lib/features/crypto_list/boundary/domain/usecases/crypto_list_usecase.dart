import 'package:crypto_list_tt/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class CryptoListUsecase {
  Future<Either<Failure, Stream<dynamic>>> initConnect({
    required List<String> streams,
  });
}
