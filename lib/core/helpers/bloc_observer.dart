import 'dart:developer' as dev;

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    dev.log('🟡 onCreate -- ${bloc.runtimeType}', name: 'BLOC');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    dev.log('🟢 onChange -- ${bloc.runtimeType}, $change', name: 'BLOC');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    dev.log('🔴 onError -- ${bloc.runtimeType}, $error', name: 'BLOC');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dev.log('⚫️ onClose -- ${bloc.runtimeType}', name: 'BLOC');
  }
}