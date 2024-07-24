import 'dart:async';

import 'package:crypto_list_tt/features/crypto_list/boundary/domain/usecases/crypto_list_usecase.dart';
import 'package:crypto_list_tt/features/crypto_list/domain/entities/crypto_unit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

@injectable
class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  static const _coins = [
    'BTCUSDT',
    'ETHUSDT',
    'XRPUSDT',
    'BNBUSDT',
  ];

  final CryptoListUsecase cryptoListUsecase;
  StreamSubscription? streamSubscription;

  CryptoListBloc({
    required this.cryptoListUsecase,
  }) : super(const CryptoListState.initial()) {
    _initSocketConnect();

    on<UpdateCryptoList>(_updateCryptoList);
    on<SearchCrypto>(_searchCrypto);
  }

  @override
  Future<void> close() async {
    await streamSubscription?.cancel();

    return super.close();
  }

  Future<void> _initSocketConnect() async {
    final streams = _coins
        .map(
          (coin) => '${coin.toLowerCase()}@miniTicker',
        )
        .toList();

    final response = await cryptoListUsecase.initConnect(
      streams: streams,
    );

    response.fold(
      (left) {
        addError(left);
      },
      (right) {
        _setSubscription(right);
      },
    );
  }

  void _setSubscription(Stream stream) async {
    if (streamSubscription != null) {
      await streamSubscription?.cancel();
      streamSubscription = null;
    }

    streamSubscription = stream.listen((data) {
      if (data is! CryptoUnit) return;

      add(
        UpdateCryptoList(
          cryptoUnit: data,
        ),
      );
    });
  }

  void _updateCryptoList(UpdateCryptoList event, Emitter emit) {
    final cryptoUnit = event.cryptoUnit;

    final cryptoList = [...state.cryptoList];

    final cryptloListUnitIndex = cryptoList.indexWhere(
      (crypto) => crypto.symbol == cryptoUnit.symbol,
    );

    if (cryptloListUnitIndex == -1) {
      cryptoList.add(cryptoUnit);
    } else {
      cryptoList[cryptloListUnitIndex] = cryptoUnit;
    }

    emit(state.copyWith(
      cryptoList: cryptoList,
      status: CryptoListStateStatus.loaded,
    ));
  }

  void _searchCrypto(SearchCrypto event, Emitter emit) {
    final text = event.text.toLowerCase();

    final cryptoList = [...state.cryptoList];

    final searchData = <CryptoUnit>[];

    for (var crypto in cryptoList) {
      final symbol = crypto.symbol.toLowerCase();
      if (symbol.contains(text)) {
        searchData.add(crypto);
      }
    }

    emit(state.copyWith(
      searchData: searchData,
    ));
  }
}
