import 'package:flutter/material.dart';
import '../../features/dashboard/ui/screens/dashboard_screen.dart';
import '../../features/add_expense/ui/screens/add_expense_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case Routes.addExpenseScreen:
        return MaterialPageRoute(
          builder: (_) => const AddExpenseScreen(),
        );
      default:
        return null;
    }
  }
}
