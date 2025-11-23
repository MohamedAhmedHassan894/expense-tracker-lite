import 'package:expense_tracker/core/routing/routes.dart';
import 'package:expense_tracker/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/bloc/dashboard_bloc.dart';
import '../../logic/bloc/dashboard_event.dart';
import '../../logic/bloc/dashboard_state.dart';
import '../widgets/expense_list_view_item.dart';
import '../widgets/dashboard_top_section.dart';
import '../widgets/dashboard_filter_section.dart';
import '../../../../core/di/injection_container.dart' as di;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.getIt<DashboardBloc>()..add(const DashboardEvent.loadExpenses()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {
            // Handle errors
            state.maybeWhen(
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
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (
                expenses,
                displayedExpenses,
                totalBalance,
                totalIncome,
                totalExpenses,
                currentFilter,
                currentPage,
                hasMoreData,
                startDate,
                endDate,
              ) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.refreshExpenses());
                  },
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    slivers: [
                      // Collapsible SliverAppBar with gradient header
                      SliverAppBar(
                        expandedHeight: 280.0.h,
                        pinned: true,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        flexibleSpace: LayoutBuilder(
                          builder: (context, constraints) {
                            return FlexibleSpaceBar(
                              background: DashboardTopSection(
                                totalBalance: totalBalance,
                                totalIncome: totalIncome,
                                totalExpenses: totalExpenses,
                              ),
                              centerTitle: false,
                              collapseMode: CollapseMode.parallax,
                            );
                          },
                        ),
                      ),
                      // Sticky Filter Section - appears as app bar when scrolling
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _FilterHeaderDelegate(
                          child: Container(
                            color: Colors.white,
                            child: DashboardFilterSection(
                              currentFilter: currentFilter,
                            ),
                          ),
                        ),
                      ),
                      // Recent Expenses Header
                      SliverToBoxAdapter(
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Expenses',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2D3142),
                                ),
                              ),
                              Text(
                                'see all',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 8, 8, 9),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (displayedExpenses.isEmpty)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'No expenses found for the selected filter.',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        // Expenses List
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (index < displayedExpenses.length) {
                                  return ExpenseListViewItem(
                                    expense: displayedExpenses[index],
                                  );
                                } else if (hasMoreData) {
                                  // Load More Button
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<DashboardBloc>().add(
                                            const DashboardEvent
                                                .loadMoreExpenses());
                                      },
                                      child: const Text('Load More'),
                                    ),
                                  );
                                }
                                return null;
                              },
                              childCount: displayedExpenses.length +
                                  (hasMoreData ? 1 : 0),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              orElse: () => const Center(child: Text('No data available')),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.of(context).pushNamed(Routes.addExpenseScreen);
          // Refresh dashboard if expense was added successfully
          if (result == true && context.mounted) {
            context
                .read<DashboardBloc>()
                .add(const DashboardEvent.refreshExpenses());
          }
        },
        backgroundColor: ColorsManager.mainGreen,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FilterHeaderDelegate({required this.child});

  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_FilterHeaderDelegate oldDelegate) {
    return true;
  }
}
