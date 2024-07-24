part of 'crypto_list_bloc.dart';

sealed class CryptoListEvent extends Equatable {
  const CryptoListEvent();

  @override
  List<Object> get props => [];
}

class UpdateCryptoList extends CryptoListEvent {
  final CryptoUnit cryptoUnit;

  const UpdateCryptoList({required this.cryptoUnit});
}

class SearchCrypto extends CryptoListEvent {
  final String text;

  const SearchCrypto({
    required this.text,
  });
}
