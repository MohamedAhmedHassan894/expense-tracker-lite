import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection_container.dart' as di;
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';
import '../../logic/bloc/add_expense_state.dart';
import '../widgets/category_dropdown_field.dart';
import '../widgets/amount_text_field.dart';
import '../widgets/currency_dropdown_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/receipt_upload_field.dart';
import '../widgets/categories_grid.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
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
                  content: Text(apiErrorModel.message),
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
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories Section
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.textMainColor,
                      ),
                    ),
                    verticalSpace(12.h),
                    CategoryDropdownField(
                      selectedCategory: category,
                      error: categoryError,
                    ),
                    if (categoryError.isNotEmpty) ...[
                      verticalSpace(4.h),
                      Text(
                        categoryError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                    verticalSpace(24.h),

                    // Amount Section
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.textMainColor,
                      ),
                    ),
                    verticalSpace(12.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AmountTextField(
                            amount: amount,
                            error: amountError,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CurrencyDropdownField(
                            selectedCurrency: currency,
                          ),
                        ),
                      ],
                    ),
                    if (amountError.isNotEmpty) ...[
                      verticalSpace(4.h),
                      Text(
                        amountError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                    verticalSpace(24),

                    // Date Section
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.textMainColor,
                      ),
                    ),
                    verticalSpace(12.h),
                    DatePickerField(selectedDate: date),
                    verticalSpace(24.h),

                    // Receipt Section
                    Text(
                      'Attach Receipt',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.textMainColor,
                      ),
                    ),
                    verticalSpace(12.h),
                    ReceiptUploadField(receiptPath: receiptPath),
                    verticalSpace(32.h),

                    // Categories Icon Grid
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.textMainColor,
                      ),
                    ),
                    verticalSpace(16.h),
                    CategoriesGrid(selectedCategory: category),
                    verticalSpace(32.h),

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
}
