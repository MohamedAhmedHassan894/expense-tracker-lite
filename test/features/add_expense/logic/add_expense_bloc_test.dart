import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/core/networking/api_error_model.dart';
import 'package:expense_tracker/core/networking/api_result.dart' hide Success;
import 'package:expense_tracker/features/add_expense/logic/bloc/add_expense_bloc.dart';
import 'package:expense_tracker/features/add_expense/logic/bloc/add_expense_event.dart';
import 'package:expense_tracker/features/add_expense/logic/bloc/add_expense_state.dart';
import 'package:expense_tracker/features/dashboard/data/models/expense_model.dart';
import 'package:expense_tracker/features/dashboard/data/repo/dashboard_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

class FakeExpenseModel extends Fake implements ExpenseModel {}

void main() {
  late AddExpenseBloc addExpenseBloc;
  late MockDashboardRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(FakeExpenseModel());
  });

  setUp(() {
    mockRepository = MockDashboardRepository();
    addExpenseBloc = AddExpenseBloc(mockRepository);
  });

  tearDown(() {
    addExpenseBloc.close();
  });

  group('AddExpenseBloc - Expense Validation Tests', () {
    test('initial state is correct', () {
      final state = addExpenseBloc.state;
      expect(state, isA<AddExpenseState>());
      state.when(
        initial: (_, __, ___, ____, _____, ______, _______) =>
            expect(true, true),
        loading: () => fail('Should be initial state'),
        success: () => fail('Should be initial state'),
        error: (_) => fail('Should be initial state'),
      );
    });

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits validation error when category is empty',
      build: () => addExpenseBloc,
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged(''));
        bloc.add(const AddExpenseEvent.amountChanged('100'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        isA<AddExpenseState>(), // amountChanged
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, categoryError, ______) =>
                categoryError == 'Please select a category',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits validation error when amount is empty',
      build: () => addExpenseBloc,
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged(''));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, ______, amountError) =>
                amountError == 'Please enter an amount',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits validation error when amount is invalid',
      build: () => addExpenseBloc,
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('invalid'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        isA<AddExpenseState>(), // amountChanged
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, ______, amountError) =>
                amountError == 'Please enter a valid amount',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits validation error when amount is zero or negative',
      build: () => addExpenseBloc,
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('-10'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        isA<AddExpenseState>(), // amountChanged
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, ______, amountError) =>
                amountError == 'Please enter a valid amount',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits multiple validation errors when both category and amount are invalid',
      build: () => addExpenseBloc,
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged(''));
        bloc.add(const AddExpenseEvent.amountChanged(''));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // First emission
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, categoryError, amountError) =>
                categoryError.isNotEmpty && amountError.isNotEmpty,
            orElse: () => false,
          );
        }), // Second emission with validation errors
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'clears category error when valid category is entered',
      build: () => addExpenseBloc,
      seed: () => AddExpenseState.initial(
        date: DateTime.now(),
        categoryError: 'Please select a category',
      ),
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
      },
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, categoryError, ______) =>
                categoryError.isEmpty,
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'clears amount error when valid amount is entered',
      build: () => addExpenseBloc,
      seed: () => AddExpenseState.initial(
        date: DateTime.now(),
        amountError: 'Please enter an amount',
      ),
      act: (bloc) {
        bloc.add(const AddExpenseEvent.amountChanged('100'));
      },
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, _____, ______, amountError) =>
                amountError.isEmpty,
            orElse: () => false,
          );
        }),
      ],
    );
  });

  group('AddExpenseBloc - State Management Tests', () {
    blocTest<AddExpenseBloc, AddExpenseState>(
      'updates category when CategoryChanged is added',
      build: () => addExpenseBloc,
      act: (bloc) => bloc.add(const AddExpenseEvent.categoryChanged('food')),
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (category, _, __, ___, ____, _____, ______) =>
                category == 'food',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'updates amount when AmountChanged is added',
      build: () => addExpenseBloc,
      act: (bloc) => bloc.add(const AddExpenseEvent.amountChanged('50.5')),
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, amount, __, ___, ____, _____, ______) =>
                amount == '50.5',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'updates currency when CurrencyChanged is added',
      build: () => addExpenseBloc,
      act: (bloc) => bloc.add(const AddExpenseEvent.currencyChanged('EUR')),
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, currency, ___, ____, _____, ______) =>
                currency == 'EUR',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'updates date when DateChanged is added',
      build: () => addExpenseBloc,
      act: (bloc) {
        final newDate = DateTime(2025, 11, 20);
        bloc.add(AddExpenseEvent.dateChanged(newDate));
      },
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, date, ____, _____, ______) =>
                date.year == 2025 && date.month == 11 && date.day == 20,
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'updates receiptPath when ReceiptSelected is added',
      build: () => addExpenseBloc,
      act: (bloc) => bloc
          .add(const AddExpenseEvent.receiptSelected('/path/to/receipt.jpg')),
      expect: () => [
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            initial: (_, __, ___, ____, receiptPath, _____, ______) =>
                receiptPath == '/path/to/receipt.jpg',
            orElse: () => false,
          );
        }),
      ],
    );
  });

  group('AddExpenseBloc - Save Expense with Currency Conversion Tests', () {
    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits [Loading, Success] when expense is saved successfully with USD',
      build: () {
        when(() => mockRepository.convertToUSD(
              fromCurrency: any(named: 'fromCurrency'),
              amount: any(named: 'amount'),
            )).thenAnswer((_) async => const ApiResult.success(100.0));

        when(() => mockRepository.addExpense(any()))
            .thenAnswer((_) async => const ApiResult.success(null));

        return addExpenseBloc;
      },
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('100'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        isA<AddExpenseState>(), // amountChanged
        predicate<AddExpenseState>((state) => state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            )),
        predicate<AddExpenseState>((state) => state.maybeWhen(
              success: () => true,
              orElse: () => false,
            )),
      ],
      verify: (_) {
        verify(() => mockRepository.convertToUSD(
              fromCurrency: 'USD',
              amount: 100.0,
            )).called(1);
        verify(() => mockRepository.addExpense(any())).called(1);
      },
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits [Loading, Success] when expense is saved with currency conversion',
      build: () {
        when(() => mockRepository.convertToUSD(
              fromCurrency: 'EUR',
              amount: 100.0,
            )).thenAnswer((_) async => const ApiResult.success(110.0));

        when(() => mockRepository.addExpense(any()))
            .thenAnswer((_) async => const ApiResult.success(null));

        return addExpenseBloc;
      },
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('100'));
        bloc.add(const AddExpenseEvent.currencyChanged('EUR'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(), // categoryChanged
        isA<AddExpenseState>(), // amountChanged
        isA<AddExpenseState>(), // currencyChanged
        predicate<AddExpenseState>((state) => state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            )),
        predicate<AddExpenseState>((state) => state.maybeWhen(
              success: () => true,
              orElse: () => false,
            )),
      ],
      verify: (_) {
        verify(() => mockRepository.convertToUSD(
              fromCurrency: 'EUR',
              amount: 100.0,
            )).called(1);
      },
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits [Loading, Error] when currency conversion fails',
      build: () {
        when(() => mockRepository.convertToUSD(
              fromCurrency: any(named: 'fromCurrency'),
              amount: any(named: 'amount'),
            )).thenAnswer((_) async => ApiResult.failure(
              ApiErrorModel(message: 'Currency conversion failed'),
            ));

        return addExpenseBloc;
      },
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('100'));
        bloc.add(const AddExpenseEvent.currencyChanged('EUR'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(),
        isA<AddExpenseState>(),
        isA<AddExpenseState>(),
        predicate<AddExpenseState>((state) => state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            )),
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            error: (error) => error.message == 'Currency conversion failed',
            orElse: () => false,
          );
        }),
      ],
    );

    blocTest<AddExpenseBloc, AddExpenseState>(
      'emits [Loading, Error] when saving expense fails',
      build: () {
        when(() => mockRepository.convertToUSD(
              fromCurrency: any(named: 'fromCurrency'),
              amount: any(named: 'amount'),
            )).thenAnswer((_) async => const ApiResult.success(100.0));

        when(() => mockRepository.addExpense(any())).thenAnswer(
          (_) async => ApiResult.failure(
            ApiErrorModel(message: 'Failed to save expense'),
          ),
        );

        return addExpenseBloc;
      },
      act: (bloc) {
        bloc.add(const AddExpenseEvent.categoryChanged('food'));
        bloc.add(const AddExpenseEvent.amountChanged('100'));
        bloc.add(const AddExpenseEvent.saveExpense());
      },
      expect: () => [
        isA<AddExpenseState>(),
        isA<AddExpenseState>(),
        predicate<AddExpenseState>((state) => state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            )),
        predicate<AddExpenseState>((state) {
          return state.maybeWhen(
            error: (error) => error.message == 'Failed to save expense',
            orElse: () => false,
          );
        }),
      ],
    );
  });
}
