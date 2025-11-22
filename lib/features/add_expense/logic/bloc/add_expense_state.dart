import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'add_expense_state.freezed.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  const factory AddExpenseState.initial({
    @Default('') String category,
    @Default('') String amount,
    @Default('USD') String currency,
    required DateTime date,
    String? receiptPath,
    @Default('') String categoryError,
    @Default('') String amountError,
  }) = _Initial;

  const factory AddExpenseState.loading() = Loading;

  const factory AddExpenseState.success() = Success;

  const factory AddExpenseState.error(ApiErrorModel apiErrorModel) = Error;
}
