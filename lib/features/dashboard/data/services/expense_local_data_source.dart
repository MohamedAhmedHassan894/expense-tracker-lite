import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/expense_model.dart';

class ExpenseLocalDataSource {
  static const String _boxName = 'expenses';
  Box<ExpenseModel>? _expenseBox;

  Future<void> init() async {
    // Initialize Hive using a platform-specific directory
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ExpenseModelAdapter());
    }
    _expenseBox = await Hive.openBox<ExpenseModel>(_boxName);
  }

  Box<ExpenseModel> get expenseBox {
    if (_expenseBox == null || !_expenseBox!.isOpen) {
      throw Exception('Expense box is not initialized');
    }
    return _expenseBox!;
  }

  Future<void> addExpense(ExpenseModel expense) async {
    await expenseBox.put(expense.id, expense);
  }

  Future<void> deleteExpense(String id) async {
    await expenseBox.delete(id);
  }

  Future<void> updateExpense(ExpenseModel expense) async {
    await expenseBox.put(expense.id, expense);
  }

  ExpenseModel? getExpense(String id) {
    return expenseBox.get(id);
  }

  List<ExpenseModel> getAllExpenses() {
    return expenseBox.values.toList();
  }

  List<ExpenseModel> getExpensesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return expenseBox.values.where((expense) {
      return expense.date
              .isAfter(startDate.subtract(const Duration(days: 1))) &&
          expense.date.isBefore(endDate.add(const Duration(days: 1)));
    }).toList();
  }

  List<ExpenseModel> getExpensesByCategory(String category) {
    return expenseBox.values
        .where((expense) => expense.category == category)
        .toList();
  }

  double getTotalExpenses() {
    return expenseBox.values
        .fold(0.0, (sum, expense) => sum + expense.amountInUSD);
  }

  double getTotalExpensesByDateRange(DateTime startDate, DateTime endDate) {
    return getExpensesByDateRange(startDate, endDate)
        .fold(0.0, (sum, expense) => sum + expense.amountInUSD);
  }

  Future<void> clearAll() async {
    await expenseBox.clear();
  }
}
