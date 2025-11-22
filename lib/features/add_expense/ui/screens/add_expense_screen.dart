import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection_container.dart' as di;
import '../../../../core/helpers/expense_categories.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';
import '../../logic/bloc/add_expense_state.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<AddExpenseBloc>(),
      child: const _AddExpenseView(),
    );
  }
}

class _AddExpenseView extends StatelessWidget {
  const _AddExpenseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AddExpenseBloc, AddExpenseState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              // Show success message and navigate back
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Expense added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context, true); // Pass true to indicate success
            },
            error: (apiErrorModel) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(apiErrorModel.message ?? 'An error occurred'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return state.maybeWhen(
            initial: (category, amount, currency, date, receiptPath,
                categoryError, amountError) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories Section
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    verticalSpace(12),
                    _buildCategoryDropdown(context, category, categoryError),
                    if (categoryError.isNotEmpty) ...[
                      verticalSpace(4),
                      Text(
                        categoryError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                    verticalSpace(24),

                    // Amount Section
                    const Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child:
                              _buildAmountField(context, amount, amountError),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCurrencyDropdown(context, currency),
                        ),
                      ],
                    ),
                    if (amountError.isNotEmpty) ...[
                      verticalSpace(4),
                      Text(
                        amountError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                    verticalSpace(24),

                    // Date Section
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    verticalSpace(12),
                    _buildDateField(context, date),
                    verticalSpace(24),

                    // Receipt Section
                    const Text(
                      'Attach Receipt',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    verticalSpace(12),
                    _buildReceiptUpload(context, receiptPath),
                    verticalSpace(32),

                    // Categories Icon Grid
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    verticalSpace(16),
                    _buildCategoriesGrid(context, category),
                    verticalSpace(32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<AddExpenseBloc>()
                              .add(const AddExpenseEvent.saveExpense());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.mainGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCategoryDropdown(
      BuildContext context, String selectedCategory, String error) {
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

  Widget _buildAmountField(BuildContext context, String amount, String error) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: '\$50.000',
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

  Widget _buildCurrencyDropdown(BuildContext context, String selectedCurrency) {
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

  Widget _buildDateField(BuildContext context, DateTime selectedDate) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          context
              .read<AddExpenseBloc>()
              .add(AddExpenseEvent.dateChanged(pickedDate));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MM/dd/yy').format(selectedDate),
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2D3142),
              ),
            ),
            const Icon(Icons.calendar_today, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptUpload(BuildContext context, String? receiptPath) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          context
              .read<AddExpenseBloc>()
              .add(AddExpenseEvent.receiptSelected(image.path));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              receiptPath != null ? 'Receipt attached' : 'Upload Image',
              style: TextStyle(
                fontSize: 16,
                color: receiptPath != null
                    ? const Color(0xFF2D3142)
                    : Colors.grey[400],
              ),
            ),
            const Icon(Icons.camera_alt, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context, String selectedCategory) {
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
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
