import 'package:crypto_list_tt/core/router/app_router.dart';
import 'package:crypto_list_tt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto List TT',
      routerConfig: AppRouter.routerConfig,
      theme: AppTheme.theme(),
    );
  }
}
