import 'package:crypto_list_tt/features/crypto_list/presentation/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/widgets/crypto_list_builder.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/widgets/search_crypto_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListPage extends StatelessWidget {
  static const route = '/crypto_list_page';
  const CryptoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(
                top: 14,
              ),
              sliver: const SliverToBoxAdapter(
                child: SearchCryptoField(),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(
            top: 34,
            bottom: 14,
          ),
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            builder: (context, state) {
              final cryptoList = state.cryptoList;
              final searchData = state.searchData;

              if (searchData.isNotEmpty) {
                return CryptoListBuilder(
                  cryptoList: searchData,
                );
              }

              return CryptoListBuilder(
                cryptoList: cryptoList,
              );
            },
          ),
        ),
      )),
    );
  }
}
