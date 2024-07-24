import 'package:crypto_list_tt/core/errors/failure.dart';
import 'package:crypto_list_tt/features/crypto_list/boundary/adapters/services/crypto_socket_service.dart';
import 'package:crypto_list_tt/features/crypto_list/boundary/domain/usecases/crypto_list_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CryptoListUsecase)
class CryptoListUsecaseImpl extends CryptoListUsecase {
  final CryptoSocketService cryptoSocketService;

  CryptoListUsecaseImpl({
    required this.cryptoSocketService,
  });

  @override
  Future<Either<Failure, Stream>> initConnect({
    required List<String> streams,
  }) async {
    return await cryptoSocketService.initConnect(
      streams: streams,
    );
  }
}
