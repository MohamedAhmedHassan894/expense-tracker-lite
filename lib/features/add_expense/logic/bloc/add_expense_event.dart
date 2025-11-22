import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_expense_event.freezed.dart';

@freezed
class AddExpenseEvent with _$AddExpenseEvent {
  const factory AddExpenseEvent.categoryChanged(String category) =
      CategoryChanged;

  const factory AddExpenseEvent.amountChanged(String amount) = AmountChanged;

  const factory AddExpenseEvent.currencyChanged(String currency) =
      CurrencyChanged;

  const factory AddExpenseEvent.dateChanged(DateTime date) = DateChanged;

  const factory AddExpenseEvent.receiptSelected(String? path) = ReceiptSelected;

  const factory AddExpenseEvent.saveExpense() = SaveExpense;
}
