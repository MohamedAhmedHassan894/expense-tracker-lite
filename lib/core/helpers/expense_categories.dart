import 'package:flutter/material.dart';

class ExpenseCategory {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class ExpenseCategories {
  static const groceries = ExpenseCategory(
    id: 'groceries',
    name: 'Groceries',
    icon: Icons.shopping_cart,
    color: Color(0xFF5B7FFF),
  );

  static const entertainment = ExpenseCategory(
    id: 'entertainment',
    name: 'Entertainment',
    icon: Icons.movie,
    color: Color(0xFFFF6B9D),
  );

  static const gas = ExpenseCategory(
    id: 'gas',
    name: 'Gas',
    icon: Icons.local_gas_station,
    color: Color(0xFFFF8A65),
  );

  static const shopping = ExpenseCategory(
    id: 'shopping',
    name: 'Shopping',
    icon: Icons.shopping_bag,
    color: Color(0xFFFFD54F),
  );

  static const transport = ExpenseCategory(
    id: 'transport',
    name: 'Transport',
    icon: Icons.directions_car,
    color: Color(0xFF9575CD),
  );

  static const rent = ExpenseCategory(
    id: 'rent',
    name: 'Rent',
    icon: Icons.home,
    color: Color(0xFFFF9E80),
  );

  static const newsPaper = ExpenseCategory(
    id: 'news_paper',
    name: 'News Paper',
    icon: Icons.newspaper,
    color: Color(0xFFFFF59D),
  );

  static List<ExpenseCategory> all = [
    groceries,
    entertainment,
    gas,
    shopping,
    transport,
    rent,
    newsPaper,
  ];

  static ExpenseCategory? getById(String id) {
    try {
      return all.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  static ExpenseCategory getByIdOrDefault(String id) {
    return getById(id) ?? groceries;
  }
}
