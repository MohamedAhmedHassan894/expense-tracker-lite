import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/expense_model.dart';
import '../../data/repo/dashboard_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;
  static const int _pageSize = 10;

  DashboardBloc(this._repository) : super(const DashboardState.initial()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<FilterByDateRange>(_onFilterByDateRange);
    on<FilterByThisMonth>(_onFilterByThisMonth);
    on<FilterByLast7Days>(_onFilterByLast7Days);
    on<LoadMoreExpenses>(_onLoadMoreExpenses);
    on<RefreshExpenses>(_onRefreshExpenses);
    on<DeleteExpense>(_onDeleteExpense);
  }

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    final result = _repository.getAllExpenses();

    result.when(
      success: (expenses) {
        _emitSuccessState(
          emit,
          expenses: expenses,
          currentPage: 1,
          currentFilter: DateFilter.all,
        );
      },
      failure: (error) {
        emit(DashboardState.error(error));
      },
    );
  }

  Future<void> _onFilterByThisMonth(
    FilterByThisMonth event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1);
    final endDate = DateTime(now.year, now.month + 1, 0);

    final result = _repository.getExpensesByDateRange(startDate, endDate);

    result.when(
      success: (expenses) {
        _emitSuccessState(
          emit,
          expenses: expenses,
          currentPage: 1,
          currentFilter: DateFilter.thisMonth,
          startDate: startDate,
          endDate: endDate,
        );
      },
      failure: (error) {
        emit(DashboardState.error(error));
      },
    );
  }

  Future<void> _onFilterByLast7Days(
    FilterByLast7Days event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 7));
    final endDate = now;

    final result = _repository.getExpensesByDateRange(startDate, endDate);

    result.when(
      success: (expenses) {
        _emitSuccessState(
          emit,
          expenses: expenses,
          currentPage: 1,
          currentFilter: DateFilter.last7Days,
          startDate: startDate,
          endDate: endDate,
        );
      },
      failure: (error) {
        emit(DashboardState.error(error));
      },
    );
  }

  Future<void> _onFilterByDateRange(
    FilterByDateRange event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());

    final result = _repository.getExpensesByDateRange(
      event.startDate,
      event.endDate,
    );

    result.when(
      success: (expenses) {
        _emitSuccessState(
          emit,
          expenses: expenses,
          currentPage: 1,
          currentFilter: DateFilter.custom,
          startDate: event.startDate,
          endDate: event.endDate,
        );
      },
      failure: (error) {
        emit(DashboardState.error(error));
      },
    );
  }

  Future<void> _onLoadMoreExpenses(
    LoadMoreExpenses event,
    Emitter<DashboardState> emit,
  ) async {
    if (state is! Success) return;

    final currentState = state as Success;
    if (!currentState.hasMoreData) return;

    emit(const DashboardState.loadingMore());

    final nextPage = currentState.currentPage + 1;
    final startIndex = currentState.displayedExpenses.length;
    final endIndex = startIndex + _pageSize;

    final moreExpenses =
        currentState.expenses.skip(startIndex).take(_pageSize).toList();

    final updatedDisplayedExpenses = [
      ...currentState.displayedExpenses,
      ...moreExpenses,
    ];

    emit(DashboardState.success(
      expenses: currentState.expenses,
      displayedExpenses: updatedDisplayedExpenses,
      totalBalance: currentState.totalBalance,
      totalIncome: currentState.totalIncome,
      totalExpenses: currentState.totalExpenses,
      currentFilter: currentState.currentFilter,
      currentPage: nextPage,
      hasMoreData: endIndex < currentState.expenses.length,
      startDate: currentState.startDate,
      endDate: currentState.endDate,
    ));
  }

  Future<void> _onRefreshExpenses(
    RefreshExpenses event,
    Emitter<DashboardState> emit,
  ) async {
    // Get the current state to preserve filter settings
    final currentState = state is Success ? state as Success : null;
    final currentFilter = currentState?.currentFilter ?? DateFilter.all;
    final startDate = currentState?.startDate;
    final endDate = currentState?.endDate;

    // Reload data based on current filter
    switch (currentFilter) {
      case DateFilter.all:
        final result = _repository.getAllExpenses();
        result.when(
          success: (expenses) {
            _emitSuccessState(
              emit,
              expenses: expenses,
              currentPage: 1,
              currentFilter: DateFilter.all,
            );
          },
          failure: (error) {
            emit(DashboardState.error(error));
          },
        );
        break;
      case DateFilter.thisMonth:
        final now = DateTime.now();
        final monthStart = DateTime(now.year, now.month, 1);
        final monthEnd = DateTime(now.year, now.month + 1, 0);
        final result = _repository.getExpensesByDateRange(monthStart, monthEnd);
        result.when(
          success: (expenses) {
            _emitSuccessState(
              emit,
              expenses: expenses,
              currentPage: 1,
              currentFilter: DateFilter.thisMonth,
              startDate: monthStart,
              endDate: monthEnd,
            );
          },
          failure: (error) {
            emit(DashboardState.error(error));
          },
        );
        break;
      case DateFilter.last7Days:
        final now = DateTime.now();
        final last7Start = DateTime(now.year, now.month, now.day - 6);
        final result = _repository.getExpensesByDateRange(last7Start, now);
        result.when(
          success: (expenses) {
            _emitSuccessState(
              emit,
              expenses: expenses,
              currentPage: 1,
              currentFilter: DateFilter.last7Days,
              startDate: last7Start,
              endDate: now,
            );
          },
          failure: (error) {
            emit(DashboardState.error(error));
          },
        );
        break;
      case DateFilter.custom:
        if (startDate != null && endDate != null) {
          final result = _repository.getExpensesByDateRange(startDate, endDate);
          result.when(
            success: (expenses) {
              _emitSuccessState(
                emit,
                expenses: expenses,
                currentPage: 1,
                currentFilter: DateFilter.custom,
                startDate: startDate,
                endDate: endDate,
              );
            },
            failure: (error) {
              emit(DashboardState.error(error));
            },
          );
        } else {
          // Fallback to all expenses if custom dates are missing
          final result = _repository.getAllExpenses();
          result.when(
            success: (expenses) {
              _emitSuccessState(
                emit,
                expenses: expenses,
                currentPage: 1,
                currentFilter: DateFilter.all,
              );
            },
            failure: (error) {
              emit(DashboardState.error(error));
            },
          );
        }
        break;
    }
  }

  Future<void> _onDeleteExpense(
    DeleteExpense event,
    Emitter<DashboardState> emit,
  ) async {
    final result = await _repository.deleteExpense(event.id);

    result.when(
      success: (_) {
        // Refresh the current view
        add(const DashboardEvent.refreshExpenses());
      },
      failure: (error) {
        emit(DashboardState.error(error));
      },
    );
  }

  void _emitSuccessState(
    Emitter<DashboardState> emit, {
    required List<ExpenseModel> expenses,
    required int currentPage,
    required DateFilter currentFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    // Calculate pagination
    final displayedExpenses = expenses.take(_pageSize).toList();
    final hasMoreData = expenses.length > _pageSize;

    // Calculate totals
    final totalExpenses = expenses.fold<double>(
      0.0,
      (sum, expense) => sum + expense.amountInUSD,
    );

    // For demo purposes, assuming fixed income
    const totalIncome = 10840.0;
    final totalBalance = totalIncome - totalExpenses;

    emit(DashboardState.success(
      expenses: expenses,
      displayedExpenses: displayedExpenses,
      totalBalance: totalBalance,
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      currentFilter: currentFilter,
      currentPage: currentPage,
      hasMoreData: hasMoreData,
      startDate: startDate,
      endDate: endDate,
    ));
  }
}
