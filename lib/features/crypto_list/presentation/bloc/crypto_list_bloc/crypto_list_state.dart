part of 'crypto_list_bloc.dart';

class CryptoListState extends Equatable {
  final CryptoListStateStatus status;

  final List<CryptoUnit> cryptoList;

  final List<CryptoUnit> searchData;

  const CryptoListState(
      {required this.status,
      required this.cryptoList,
      required this.searchData});

  const CryptoListState.initial()
      : status = CryptoListStateStatus.initial,
        searchData = const [],
        cryptoList = const [];

  @override
  List<Object> get props => [
        status,
        cryptoList,
        searchData,
      ];

  CryptoListState copyWith({
    CryptoListStateStatus? status,
    List<CryptoUnit>? cryptoList,
    List<CryptoUnit>? searchData,
  }) {
    return CryptoListState(
      status: status ?? this.status,
      cryptoList: cryptoList ?? this.cryptoList,
      searchData: searchData ?? this.searchData,
    );
  }
}

enum CryptoListStateStatus {
  initial,
  loading,
  loaded,
  failure,
}
