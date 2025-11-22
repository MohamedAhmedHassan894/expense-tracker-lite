import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadExpenses() = LoadExpenses;

  const factory DashboardEvent.filterByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) = FilterByDateRange;

  const factory DashboardEvent.filterByThisMonth() = FilterByThisMonth;

  const factory DashboardEvent.filterByLast7Days() = FilterByLast7Days;

  const factory DashboardEvent.loadMoreExpenses() = LoadMoreExpenses;

  const factory DashboardEvent.refreshExpenses() = RefreshExpenses;

  const factory DashboardEvent.deleteExpense(String id) = DeleteExpense;
}
