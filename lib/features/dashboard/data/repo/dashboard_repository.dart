import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/currency_response_model.dart';
import '../models/expense_model.dart';
import '../services/currency_api_service.dart';
import '../services/expense_local_data_source.dart';

class DashboardRepository {
  final CurrencyApiService _currencyApiService;
  final ExpenseLocalDataSource _localDataSource;

  DashboardRepository(this._currencyApiService, this._localDataSource);

  // Currency API
  Future<ApiResult<double>> convertToUSD({
    required String fromCurrency,
    required double amount,
  }) async {
    try {
      if (fromCurrency.toUpperCase() == 'USD') {
        return ApiResult.success(amount);
      }

      final response = await _currencyApiService.getExchangeRates(fromCurrency);
      final usdRate = response.getRateForCurrency('USD');

      if (usdRate == null) {
        return ApiResult.failure(
          ApiErrorHandler.handle('Currency rate not found'),
        );
      }

      final convertedAmount = amount * usdRate;
      return ApiResult.success(convertedAmount);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CurrencyResponseModel>> getExchangeRates(
      String baseCurrency) async {
    try {
      final response = await _currencyApiService.getExchangeRates(baseCurrency);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Local Storage Operations
  Future<ApiResult<void>> addExpense(ExpenseModel expense) async {
    try {
      await _localDataSource.addExpense(expense);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> updateExpense(ExpenseModel expense) async {
    try {
      await _localDataSource.updateExpense(expense);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteExpense(String id) async {
    try {
      await _localDataSource.deleteExpense(id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  ApiResult<List<ExpenseModel>> getAllExpenses() {
    try {
      final expenses = _localDataSource.getAllExpenses();
      // Sort by date (newest first)
      expenses.sort((a, b) => b.date.compareTo(a.date));
      return ApiResult.success(expenses);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  ApiResult<List<ExpenseModel>> getExpensesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    try {
      final expenses =
          _localDataSource.getExpensesByDateRange(startDate, endDate);
      expenses.sort((a, b) => b.date.compareTo(a.date));
      return ApiResult.success(expenses);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  ApiResult<double> getTotalExpenses() {
    try {
      final total = _localDataSource.getTotalExpenses();
      return ApiResult.success(total);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  ApiResult<double> getTotalExpensesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    try {
      final total =
          _localDataSource.getTotalExpensesByDateRange(startDate, endDate);
      return ApiResult.success(total);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
