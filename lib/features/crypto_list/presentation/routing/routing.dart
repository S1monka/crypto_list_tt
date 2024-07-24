import 'package:crypto_list_tt/features/crypto_list/presentation/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/pages/crypto_list_page.dart';
import 'package:crypto_list_tt/getIt/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class CryptoListRouting {
  static final List<RouteBase> routes = [
    GoRoute(
      path: CryptoListPage.route,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => getIt<CryptoListBloc>(),
          child: const CryptoListPage(),
        );
      },
    ),
  ];
}
