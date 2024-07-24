import 'package:crypto_list_tt/features/crypto_list/domain/entities/crypto_unit.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/widgets/crypto_list_tile.dart';
import 'package:flutter/material.dart';

class CryptoListBuilder extends StatelessWidget {
  final List<CryptoUnit> cryptoList;
  const CryptoListBuilder({
    super.key,
    required this.cryptoList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final cryptoUnit = cryptoList[index];

        return CryptoListTile(
          cryptoUnit: cryptoUnit,
        );
      },
      itemCount: cryptoList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 24,
        );
      },
    );
  }
}
