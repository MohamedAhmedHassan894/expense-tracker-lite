import 'dart:async';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dashboard/data/models/expense_model.dart';
import '../../../dashboard/data/repo/dashboard_repository.dart';
import 'add_expense_event.dart';
import 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final DashboardRepository _repository;
  final _uuid = const Uuid();

  AddExpenseBloc(this._repository)
      : super(AddExpenseState.initial(date: DateTime.now())) {
    on<CategoryChanged>(_onCategoryChanged);
    on<AmountChanged>(_onAmountChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<DateChanged>(_onDateChanged);
    on<ReceiptSelected>(_onReceiptSelected);
    on<SaveExpense>(_onSaveExpense);
  }

  void _onCategoryChanged(
    CategoryChanged event,
    Emitter<AddExpenseState> emit,
  ) {
    state.mapOrNull(initial: (s) {
      emit(s.copyWith(category: event.category, categoryError: ''));
    });
  }

  void _onAmountChanged(
    AmountChanged event,
    Emitter<AddExpenseState> emit,
  ) {
    state.mapOrNull(initial: (s) {
      emit(s.copyWith(amount: event.amount, amountError: ''));
    });
  }

  void _onCurrencyChanged(
    CurrencyChanged event,
    Emitter<AddExpenseState> emit,
  ) {
    state.mapOrNull(initial: (s) {
      emit(s.copyWith(currency: event.currency));
    });
  }

  void _onDateChanged(
    DateChanged event,
    Emitter<AddExpenseState> emit,
  ) {
    state.mapOrNull(initial: (s) {
      emit(s.copyWith(date: event.date));
    });
  }

  void _onReceiptSelected(
    ReceiptSelected event,
    Emitter<AddExpenseState> emit,
  ) {
    state.mapOrNull(initial: (s) {
      emit(s.copyWith(receiptPath: event.path));
    });
  }

  Future<void> _onSaveExpense(
    SaveExpense event,
    Emitter<AddExpenseState> emit,
  ) async {
    await state.mapOrNull(initial: (s) async {
      // Validation
      String categoryError = '';
      String amountError = '';

      if (s.category.isEmpty) {
        categoryError = 'Please select a category';
      }

      if (s.amount.isEmpty) {
        amountError = 'Please enter an amount';
      } else {
        final parsedAmount = double.tryParse(s.amount);
        if (parsedAmount == null || parsedAmount <= 0) {
          amountError = 'Please enter a valid amount';
        }
      }

      if (categoryError.isNotEmpty || amountError.isNotEmpty) {
        emit(s.copyWith(
          categoryError: categoryError,
          amountError: amountError,
        ));
        return;
      }

      emit(const AddExpenseState.loading());

      final amount = double.parse(s.amount);

      final conversionResult = await _repository.convertToUSD(
        fromCurrency: s.currency,
        amount: amount,
      );

      await conversionResult.when(
        success: (amountInUSD) async {
          final expense = ExpenseModel(
            id: _uuid.v4(),
            category: s.category,
            amount: amount,
            currency: s.currency,
            amountInUSD: amountInUSD,
            date: s.date,
            receiptPath: s.receiptPath,
            createdAt: DateTime.now(),
          );

          final saveResult = await _repository.addExpense(expense);
          saveResult.when(
            success: (_) => emit(const AddExpenseState.success()),
            failure: (error) => emit(AddExpenseState.error(error)),
          );
        },
        failure: (error) {
          emit(AddExpenseState.error(error));
        },
      );
    });
  }
}
