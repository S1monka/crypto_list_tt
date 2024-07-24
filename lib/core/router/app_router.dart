import 'package:crypto_list_tt/features/crypto_list/presentation/pages/crypto_list_page.dart';
import 'package:crypto_list_tt/features/crypto_list/presentation/routing/routing.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => CryptoListPage.route,
      ),
      ...CryptoListRouting.routes,
    ],
  );
}
