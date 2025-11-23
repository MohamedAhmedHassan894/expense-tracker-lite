import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';

class CurrencyDropdownField extends StatelessWidget {
  final String selectedCurrency;

  const CurrencyDropdownField({
    super.key,
    required this.selectedCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD', 'EGP'];

    return DropdownButtonFormField<String>(
      value: selectedCurrency,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      items: currencies.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          context
              .read<AddExpenseBloc>()
              .add(AddExpenseEvent.currencyChanged(value));
        }
      },
    );
  }
}
