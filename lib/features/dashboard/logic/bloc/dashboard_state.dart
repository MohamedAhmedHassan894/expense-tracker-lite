import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/models/expense_model.dart';

part 'dashboard_state.freezed.dart';

enum DateFilter { all, thisMonth, last7Days, custom }

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

  const factory DashboardState.loading() = Loading;

  const factory DashboardState.loadingMore() = LoadingMore;

  const factory DashboardState.success({
    required List<ExpenseModel> expenses,
    required List<ExpenseModel> displayedExpenses,
    required double totalBalance,
    required double totalIncome,
    required double totalExpenses,
    required DateFilter currentFilter,
    required int currentPage,
    required bool hasMoreData,
    DateTime? startDate,
    DateTime? endDate,
  }) = Success;

  const factory DashboardState.error(ApiErrorModel apiErrorModel) = Error;
}
