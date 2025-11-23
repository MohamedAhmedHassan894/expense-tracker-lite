import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';

class AmountTextField extends StatelessWidget {
  final String amount;
  final String error;

  const AmountTextField({
    super.key,
    required this.amount,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: '\$50.000',
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      onChanged: (value) {
        context
            .read<AddExpenseBloc>()
            .add(AddExpenseEvent.amountChanged(value));
      },
    );
  }
}
