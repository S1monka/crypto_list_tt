import 'package:crypto_list_tt/core/theme/app_colors.dart';
import 'package:crypto_list_tt/features/crypto_list/domain/entities/crypto_unit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoListTile extends StatelessWidget {
  final CryptoUnit cryptoUnit;
  const CryptoListTile({
    super.key,
    required this.cryptoUnit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final priceColor =
        cryptoUnit.isDifferenceNegative ? AppColors.red : AppColors.green;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Name(symbol: cryptoUnit.symbol),
            const SizedBox(height: 4),
            Text(
              'Vol ${NumberFormat.compact().format(cryptoUnit.volume)}',
              style: textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(width: 33),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${cryptoUnit.closeValue}',
              style: textTheme.bodyLarge?.copyWith(
                color: priceColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${cryptoUnit.closeValue} \$',
              style: textTheme.bodySmall,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 103,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: priceColor,
          ),
          child: Center(
            child: Text(
              '${cryptoUnit.differenceInPercent.toStringAsFixed(2)} %',
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final String symbol;
  const _Name({
    super.key,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    final coinName = symbol.substring(0, 3);
    final swapCoinName = symbol.substring(3);

    final textTheme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: coinName,
            style: textTheme.titleMedium,
          ),
          TextSpan(
            text: '/$swapCoinName',
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
