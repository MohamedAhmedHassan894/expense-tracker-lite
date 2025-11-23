import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/expense_categories.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';

class CategoriesGrid extends StatelessWidget {
  final String selectedCategory;

  const CategoriesGrid({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: ExpenseCategories.all.length + 1,
      itemBuilder: (context, index) {
        if (index < ExpenseCategories.all.length) {
          final category = ExpenseCategories.all[index];
          final isSelected = selectedCategory == category.id;

          return GestureDetector(
            onTap: () {
              context
                  .read<AddExpenseBloc>()
                  .add(AddExpenseEvent.categoryChanged(category.id));
            },
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? category.color
                        : category.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
                        ? Border.all(color: category.color, width: 2)
                        : null,
                  ),
                  child: Icon(
                    category.icon,
                    color: isSelected ? Colors.white : category.color,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 11,
                    color:
                        isSelected ? category.color : const Color(0xFF2D3142),
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        } else {
          // Add Category button
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF2D3142),
                  size: 28,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Add Category',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF2D3142),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        }
      },
    );
  }
}
