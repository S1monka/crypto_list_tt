import 'package:crypto_list_tt/app/app.dart';
import 'package:crypto_list_tt/core/utils/bloc_observer.dart';
import 'package:crypto_list_tt/getIt/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  Bloc.observer = AppBlocObserver();

  runApp(const App());
}
