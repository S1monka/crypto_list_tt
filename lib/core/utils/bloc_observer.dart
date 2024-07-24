import 'package:crypto_list_tt/core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (error is Failure) {
      Fluttertoast.showToast(
        msg: error.message,
      );
    }
  }
}
