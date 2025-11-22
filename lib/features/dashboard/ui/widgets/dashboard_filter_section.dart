import 'package:expense_tracker/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/dashboard_bloc.dart';
import '../../logic/bloc/dashboard_event.dart';
import '../../logic/bloc/dashboard_state.dart';

class DashboardFilterSection extends StatelessWidget {
  final DateFilter currentFilter;

  const DashboardFilterSection({
    super.key,
    required this.currentFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          _FilterChip(
            label: 'All',
            isSelected: currentFilter == DateFilter.all,
            onTap: () {
              context
                  .read<DashboardBloc>()
                  .add(const DashboardEvent.loadExpenses());
            },
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'This Month',
            isSelected: currentFilter == DateFilter.thisMonth,
            onTap: () {
              context
                  .read<DashboardBloc>()
                  .add(const DashboardEvent.filterByThisMonth());
            },
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Last 7 Days',
            isSelected: currentFilter == DateFilter.last7Days,
            onTap: () {
              context
                  .read<DashboardBloc>()
                  .add(const DashboardEvent.filterByLast7Days());
            },
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.mainGreen : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? ColorsManager.mainGreen : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
