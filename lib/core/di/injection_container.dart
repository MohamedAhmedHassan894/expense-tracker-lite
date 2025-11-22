import 'package:get_it/get_it.dart';
import '../../core/networking/dio_factory.dart';
import '../../features/dashboard/data/repo/dashboard_repository.dart';
import '../../features/dashboard/data/services/currency_api_service.dart';
import '../../features/dashboard/data/services/expense_local_data_source.dart';
import '../../features/dashboard/logic/bloc/dashboard_bloc.dart';
import '../../features/add_expense/logic/bloc/add_expense_bloc.dart';

// This is our global ServiceLocator
final getIt = GetIt.instance;

Future<void> init() async {
  final dio = DioFactory.getDio();

  // Local Data Source (Singleton, needs to be initialized)
  final localDataSource = ExpenseLocalDataSource();
  await localDataSource.init();
  getIt.registerLazySingleton<ExpenseLocalDataSource>(() => localDataSource);

  // Dashboard
  getIt
      .registerLazySingleton<CurrencyApiService>(() => CurrencyApiService(dio));
  getIt.registerLazySingleton<DashboardRepository>(
      () => DashboardRepository(getIt(), getIt()));
  getIt.registerFactory<DashboardBloc>(() => DashboardBloc(getIt()));

  // Add Expense
  getIt.registerFactory<AddExpenseBloc>(() => AddExpenseBloc(getIt()));
}
