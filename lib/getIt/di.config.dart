// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/crypto_list/adapters/services/crypto_socket_service_impl.dart'
    as _i177;
import '../features/crypto_list/boundary/adapters/services/crypto_socket_service.dart'
    as _i49;
import '../features/crypto_list/boundary/domain/usecases/crypto_list_usecase.dart'
    as _i481;
import '../features/crypto_list/domain/usecases/crypto_list_usecase_impl.dart'
    as _i346;
import '../features/crypto_list/presentation/bloc/crypto_list_bloc/crypto_list_bloc.dart'
    as _i452;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i49.CryptoSocketService>(() => _i177.CryptoSocketServiceImpl());
    gh.factory<_i481.CryptoListUsecase>(() => _i346.CryptoListUsecaseImpl(
        cryptoSocketService: gh<_i49.CryptoSocketService>()));
    gh.factory<_i452.CryptoListBloc>(() =>
        _i452.CryptoListBloc(cryptoListUsecase: gh<_i481.CryptoListUsecase>()));
    return this;
  }
}
