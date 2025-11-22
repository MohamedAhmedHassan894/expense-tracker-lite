import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/di/injection_container.dart' as di;
import 'core/helpers/bloc_observer.dart';
import 'expenses_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  runApp(const ExpensesApp());
}
