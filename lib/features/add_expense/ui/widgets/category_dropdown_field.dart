import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/expense_categories.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';

class CategoryDropdownField extends StatelessWidget {
  final String selectedCategory;
  final String error;

  const CategoryDropdownField({
    super.key,
    required this.selectedCategory,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final category = selectedCategory.isEmpty
        ? null
        : ExpenseCategories.getById(selectedCategory);

    return GestureDetector(
      onTap: () {
        _showCategoryPicker(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
          border: error.isNotEmpty ? Border.all(color: Colors.red) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category?.name ?? 'Entertainment',
              style: TextStyle(
                fontSize: 16,
                color: category != null
                    ? const Color(0xFF2D3142)
                    : Colors.grey[400],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext sheetContext) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...ExpenseCategories.all.map((category) {
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(category.icon, color: category.color),
                  ),
                  title: Text(category.name),
                  onTap: () {
                    context
                        .read<AddExpenseBloc>()
                        .add(AddExpenseEvent.categoryChanged(category.id));
                    Navigator.pop(sheetContext);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
