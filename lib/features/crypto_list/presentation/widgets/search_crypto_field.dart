import 'package:crypto_list_tt/core/theme/app_colors.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCryptoField extends StatelessWidget {
  const SearchCryptoField({super.key});

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelLarge;

    final cryptoListBloc = context.read<CryptoListBloc>();

    return SizedBox(
      height: 40,
      child: TextField(
        style: labelStyle,
        onChanged: (value) {
          cryptoListBloc.add(SearchCrypto(text: value));
        },
        decoration: InputDecoration(
          isDense: true,
          fillColor: const Color(0xFF29303D),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: AppColors.white.withOpacity(0.2),
          ),
          hintText: 'Search coin pairs',
          hintStyle:
              labelStyle?.copyWith(color: AppColors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}
