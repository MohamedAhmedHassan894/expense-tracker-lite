import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/core/networking/api_error_model.dart';
import 'package:expense_tracker/core/networking/api_result.dart' hide Success;
import 'package:expense_tracker/features/dashboard/data/models/expense_model.dart';
import 'package:expense_tracker/features/dashboard/data/repo/dashboard_repository.dart';
import 'package:expense_tracker/features/dashboard/logic/bloc/dashboard_bloc.dart';
import 'package:expense_tracker/features/dashboard/logic/bloc/dashboard_event.dart';
import 'package:expense_tracker/features/dashboard/logic/bloc/dashboard_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late DashboardBloc dashboardBloc;
  late MockDashboardRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(DateTime(2000));
  });

  setUp(() {
    mockRepository = MockDashboardRepository();
    dashboardBloc = DashboardBloc(mockRepository);
  });

  tearDown(() {
    dashboardBloc.close();
  });

  // Helper function to create test expenses
  List<ExpenseModel> createTestExpenses(int count) {
    return List.generate(
      count,
      (index) => ExpenseModel(
        id: 'expense_$index',
        category: 'food',
        amount: 100.0 + index,
        currency: 'USD',
        amountInUSD: 100.0 + index,
        date: DateTime(2025, 11, 20 - index),
        receiptPath: null,
        createdAt: DateTime(2025, 11, 20 - index),
      ),
    );
  }

  group('DashboardBloc - Pagination Tests', () {
    test('initial state is Initial', () {
      expect(dashboardBloc.state, equals(const DashboardState.initial()));
    });

    blocTest<DashboardBloc, DashboardState>(
      'emits [Loading, Success] with first 10 expenses when LoadExpenses is added',
      build: () {
        final expenses = createTestExpenses(25);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadExpenses()),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having((state) => (state as Success).expenses.length,
                'total expenses', 25)
            .having((state) => (state as Success).displayedExpenses.length,
                'displayed expenses', 10)
            .having(
                (state) => (state as Success).currentPage, 'current page', 1)
            .having((state) => (state as Success).hasMoreData, 'has more data',
                true),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'loads more expenses when LoadMoreExpenses is added',
      build: () {
        final expenses = createTestExpenses(25);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      seed: () {
        final expenses = createTestExpenses(25);
        return DashboardState.success(
          expenses: expenses,
          displayedExpenses: expenses.take(10).toList(),
          totalBalance: 2625.0,
          totalIncome: 0,
          totalExpenses: 2625.0,
          currentFilter: DateFilter.all,
          currentPage: 1,
          hasMoreData: true,
        );
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadMoreExpenses()),
      expect: () => [
        isA<LoadingMore>(),
        isA<Success>()
            .having((state) => (state as Success).displayedExpenses.length,
                'displayed expenses', 20)
            .having(
                (state) => (state as Success).currentPage, 'current page', 2)
            .having((state) => (state as Success).hasMoreData, 'has more data',
                true),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'does not load more when hasMoreData is false',
      build: () => dashboardBloc,
      seed: () {
        final expenses = createTestExpenses(10);
        return DashboardState.success(
          expenses: expenses,
          displayedExpenses: expenses,
          totalBalance: 1045.0,
          totalIncome: 0,
          totalExpenses: 1045.0,
          currentFilter: DateFilter.all,
          currentPage: 1,
          hasMoreData: false,
        );
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadMoreExpenses()),
      expect: () => [],
    );

    blocTest<DashboardBloc, DashboardState>(
      'sets hasMoreData to false when all expenses are displayed',
      build: () {
        final expenses = createTestExpenses(15);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      seed: () {
        final expenses = createTestExpenses(15);
        return DashboardState.success(
          expenses: expenses,
          displayedExpenses: expenses.take(10).toList(),
          totalBalance: 1605.0,
          totalIncome: 0,
          totalExpenses: 1605.0,
          currentFilter: DateFilter.all,
          currentPage: 1,
          hasMoreData: true,
        );
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadMoreExpenses()),
      expect: () => [
        isA<LoadingMore>(),
        isA<Success>()
            .having((state) => (state as Success).displayedExpenses.length,
                'displayed expenses', 15)
            .having(
                (state) => (state as Success).currentPage, 'current page', 2)
            .having((state) => (state as Success).hasMoreData, 'has more data',
                false),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'displays correct page size (10 items per page)',
      build: () {
        final expenses = createTestExpenses(35);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadExpenses()),
      expect: () => [
        isA<Loading>(),
        isA<Success>().having(
            (state) => (state as Success).displayedExpenses.length,
            'page size',
            10),
      ],
    );
  });

  group('DashboardBloc - Filter Tests with Pagination', () {
    blocTest<DashboardBloc, DashboardState>(
      'filters expenses for this month and resets pagination',
      build: () {
        final now = DateTime.now();
        final thisMonthExpenses = [
          ExpenseModel(
            id: 'expense_1',
            category: 'food',
            amount: 100.0,
            currency: 'USD',
            amountInUSD: 100.0,
            date: DateTime(now.year, now.month, 15),
            receiptPath: null,
            createdAt: DateTime(now.year, now.month, 15),
          ),
          ExpenseModel(
            id: 'expense_2',
            category: 'transport',
            amount: 50.0,
            currency: 'USD',
            amountInUSD: 50.0,
            date: DateTime(now.year, now.month, 10),
            receiptPath: null,
            createdAt: DateTime(now.year, now.month, 10),
          ),
        ];
        when(() => mockRepository.getExpensesByDateRange(any(), any()))
            .thenReturn(ApiResult.success(thisMonthExpenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.filterByThisMonth()),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having((state) => (state as Success).currentFilter, 'filter',
                DateFilter.thisMonth)
            .having((state) => (state as Success).currentPage, 'page', 1)
            .having((state) => (state as Success).displayedExpenses.length,
                'displayed', 2),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'filters expenses for last 7 days',
      build: () {
        final now = DateTime.now();
        final last7DaysExpenses = [
          ExpenseModel(
            id: 'expense_1',
            category: 'food',
            amount: 100.0,
            currency: 'USD',
            amountInUSD: 100.0,
            date: now.subtract(const Duration(days: 2)),
            receiptPath: null,
            createdAt: now.subtract(const Duration(days: 2)),
          ),
        ];
        when(() => mockRepository.getExpensesByDateRange(any(), any()))
            .thenReturn(ApiResult.success(last7DaysExpenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.filterByLast7Days()),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having((state) => (state as Success).currentFilter, 'filter',
                DateFilter.last7Days)
            .having((state) => (state as Success).currentPage, 'page', 1),
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'custom date range filter resets pagination',
      build: () {
        final customExpenses = createTestExpenses(5);
        when(() => mockRepository.getExpensesByDateRange(any(), any()))
            .thenReturn(ApiResult.success(customExpenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(DashboardEvent.filterByDateRange(
        startDate: DateTime(2025, 11, 1),
        endDate: DateTime(2025, 11, 30),
      )),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having((state) => (state as Success).currentFilter, 'filter',
                DateFilter.custom)
            .having((state) => (state as Success).currentPage, 'page', 1),
      ],
    );
  });

  group('DashboardBloc - Balance Calculation Tests', () {
    blocTest<DashboardBloc, DashboardState>(
      'calculates correct total balance from expenses',
      build: () {
        final expenses = [
          ExpenseModel(
            id: 'expense_1',
            category: 'food',
            amount: 150.0,
            currency: 'USD',
            amountInUSD: 150.0,
            date: DateTime(2025, 11, 20),
            receiptPath: null,
            createdAt: DateTime(2025, 11, 20),
          ),
          ExpenseModel(
            id: 'expense_2',
            category: 'transport',
            amount: 50.0,
            currency: 'USD',
            amountInUSD: 50.0,
            date: DateTime(2025, 11, 19),
            receiptPath: null,
            createdAt: DateTime(2025, 11, 19),
          ),
        ];
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadExpenses()),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having((state) => (state as Success).totalExpenses,
                'total expenses', 200.0)
            .having((state) => (state as Success).totalIncome, 'total income',
                10840.0)
            .having((state) => (state as Success).totalBalance, 'total balance',
                10640.0), // income - expenses = 10840 - 200
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'handles empty expense list',
      build: () {
        when(() => mockRepository.getAllExpenses())
            .thenReturn(const ApiResult.success([]));
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadExpenses()),
      expect: () => [
        isA<Loading>(),
        isA<Success>()
            .having(
                (state) => (state as Success).expenses.length, 'expenses', 0)
            .having((state) => (state as Success).totalExpenses,
                'total expenses', 0.0)
            .having((state) => (state as Success).totalIncome, 'total income',
                10840.0)
            .having((state) => (state as Success).totalBalance, 'total balance',
                10840.0), // income - 0 expenses = 10840
      ],
    );
  });

  group('DashboardBloc - Error Handling Tests', () {
    blocTest<DashboardBloc, DashboardState>(
      'emits Error when loading expenses fails',
      build: () {
        when(() => mockRepository.getAllExpenses()).thenReturn(
          ApiResult.failure(ApiErrorModel(message: 'Failed to load expenses')),
        );
        return dashboardBloc;
      },
      act: (bloc) => bloc.add(const DashboardEvent.loadExpenses()),
      expect: () => [
        isA<Loading>(),
        isA<Error>().having(
          (state) => (state as Error).apiErrorModel.message,
          'error message',
          'Failed to load expenses',
        ),
      ],
    );
  });

  group('DashboardBloc - Refresh Tests', () {
    blocTest<DashboardBloc, DashboardState>(
      'refreshes and maintains current filter',
      build: () {
        final expenses = createTestExpenses(5);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));
        return dashboardBloc;
      },
      seed: () {
        final expenses = createTestExpenses(5);
        return DashboardState.success(
          expenses: expenses,
          displayedExpenses: expenses,
          totalBalance: 510.0,
          totalIncome: 0,
          totalExpenses: 510.0,
          currentFilter: DateFilter.all,
          currentPage: 1,
          hasMoreData: false,
        );
      },
      act: (bloc) => bloc.add(const DashboardEvent.refreshExpenses()),
      expect: () => [
        isA<Success>()
            .having((state) => (state as Success).currentFilter, 'filter',
                DateFilter.all)
            .having((state) => (state as Success).currentPage, 'page', 1),
      ],
    );
  });

  group('DashboardBloc - Delete Expense Tests', () {
    blocTest<DashboardBloc, DashboardState>(
      'deletes expense and refreshes list',
      build: () {
        when(() => mockRepository.deleteExpense(any()))
            .thenAnswer((_) async => const ApiResult.success(null));

        final expenses = createTestExpenses(5);
        when(() => mockRepository.getAllExpenses())
            .thenReturn(ApiResult.success(expenses));

        return dashboardBloc;
      },
      seed: () {
        final expenses = createTestExpenses(5);
        return DashboardState.success(
          expenses: expenses,
          displayedExpenses: expenses,
          totalBalance: 510.0,
          totalIncome: 0,
          totalExpenses: 510.0,
          currentFilter: DateFilter.all,
          currentPage: 1,
          hasMoreData: false,
        );
      },
      act: (bloc) => bloc.add(const DashboardEvent.deleteExpense('expense_1')),
      expect: () => [
        isA<Success>(),
      ],
      verify: (_) {
        verify(() => mockRepository.deleteExpense('expense_1')).called(1);
      },
    );
  });
}
