// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadExpensesImplCopyWith<$Res> {
  factory _$$LoadExpensesImplCopyWith(
          _$LoadExpensesImpl value, $Res Function(_$LoadExpensesImpl) then) =
      __$$LoadExpensesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadExpensesImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$LoadExpensesImpl>
    implements _$$LoadExpensesImplCopyWith<$Res> {
  __$$LoadExpensesImplCopyWithImpl(
      _$LoadExpensesImpl _value, $Res Function(_$LoadExpensesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadExpensesImpl implements LoadExpenses {
  const _$LoadExpensesImpl();

  @override
  String toString() {
    return 'DashboardEvent.loadExpenses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadExpensesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return loadExpenses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return loadExpenses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (loadExpenses != null) {
      return loadExpenses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return loadExpenses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return loadExpenses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (loadExpenses != null) {
      return loadExpenses(this);
    }
    return orElse();
  }
}

abstract class LoadExpenses implements DashboardEvent {
  const factory LoadExpenses() = _$LoadExpensesImpl;
}

/// @nodoc
abstract class _$$FilterByDateRangeImplCopyWith<$Res> {
  factory _$$FilterByDateRangeImplCopyWith(_$FilterByDateRangeImpl value,
          $Res Function(_$FilterByDateRangeImpl) then) =
      __$$FilterByDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$FilterByDateRangeImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$FilterByDateRangeImpl>
    implements _$$FilterByDateRangeImplCopyWith<$Res> {
  __$$FilterByDateRangeImplCopyWithImpl(_$FilterByDateRangeImpl _value,
      $Res Function(_$FilterByDateRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$FilterByDateRangeImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FilterByDateRangeImpl implements FilterByDateRange {
  const _$FilterByDateRangeImpl(
      {required this.startDate, required this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'DashboardEvent.filterByDateRange(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByDateRangeImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByDateRangeImplCopyWith<_$FilterByDateRangeImpl> get copyWith =>
      __$$FilterByDateRangeImplCopyWithImpl<_$FilterByDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return filterByDateRange(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return filterByDateRange?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByDateRange != null) {
      return filterByDateRange(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return filterByDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return filterByDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByDateRange != null) {
      return filterByDateRange(this);
    }
    return orElse();
  }
}

abstract class FilterByDateRange implements DashboardEvent {
  const factory FilterByDateRange(
      {required final DateTime startDate,
      required final DateTime endDate}) = _$FilterByDateRangeImpl;

  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByDateRangeImplCopyWith<_$FilterByDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByThisMonthImplCopyWith<$Res> {
  factory _$$FilterByThisMonthImplCopyWith(_$FilterByThisMonthImpl value,
          $Res Function(_$FilterByThisMonthImpl) then) =
      __$$FilterByThisMonthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterByThisMonthImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$FilterByThisMonthImpl>
    implements _$$FilterByThisMonthImplCopyWith<$Res> {
  __$$FilterByThisMonthImplCopyWithImpl(_$FilterByThisMonthImpl _value,
      $Res Function(_$FilterByThisMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilterByThisMonthImpl implements FilterByThisMonth {
  const _$FilterByThisMonthImpl();

  @override
  String toString() {
    return 'DashboardEvent.filterByThisMonth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterByThisMonthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return filterByThisMonth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return filterByThisMonth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByThisMonth != null) {
      return filterByThisMonth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return filterByThisMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return filterByThisMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByThisMonth != null) {
      return filterByThisMonth(this);
    }
    return orElse();
  }
}

abstract class FilterByThisMonth implements DashboardEvent {
  const factory FilterByThisMonth() = _$FilterByThisMonthImpl;
}

/// @nodoc
abstract class _$$FilterByLast7DaysImplCopyWith<$Res> {
  factory _$$FilterByLast7DaysImplCopyWith(_$FilterByLast7DaysImpl value,
          $Res Function(_$FilterByLast7DaysImpl) then) =
      __$$FilterByLast7DaysImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterByLast7DaysImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$FilterByLast7DaysImpl>
    implements _$$FilterByLast7DaysImplCopyWith<$Res> {
  __$$FilterByLast7DaysImplCopyWithImpl(_$FilterByLast7DaysImpl _value,
      $Res Function(_$FilterByLast7DaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilterByLast7DaysImpl implements FilterByLast7Days {
  const _$FilterByLast7DaysImpl();

  @override
  String toString() {
    return 'DashboardEvent.filterByLast7Days()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterByLast7DaysImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return filterByLast7Days();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return filterByLast7Days?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByLast7Days != null) {
      return filterByLast7Days();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return filterByLast7Days(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return filterByLast7Days?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (filterByLast7Days != null) {
      return filterByLast7Days(this);
    }
    return orElse();
  }
}

abstract class FilterByLast7Days implements DashboardEvent {
  const factory FilterByLast7Days() = _$FilterByLast7DaysImpl;
}

/// @nodoc
abstract class _$$LoadMoreExpensesImplCopyWith<$Res> {
  factory _$$LoadMoreExpensesImplCopyWith(_$LoadMoreExpensesImpl value,
          $Res Function(_$LoadMoreExpensesImpl) then) =
      __$$LoadMoreExpensesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreExpensesImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$LoadMoreExpensesImpl>
    implements _$$LoadMoreExpensesImplCopyWith<$Res> {
  __$$LoadMoreExpensesImplCopyWithImpl(_$LoadMoreExpensesImpl _value,
      $Res Function(_$LoadMoreExpensesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreExpensesImpl implements LoadMoreExpenses {
  const _$LoadMoreExpensesImpl();

  @override
  String toString() {
    return 'DashboardEvent.loadMoreExpenses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreExpensesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return loadMoreExpenses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return loadMoreExpenses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (loadMoreExpenses != null) {
      return loadMoreExpenses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return loadMoreExpenses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return loadMoreExpenses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (loadMoreExpenses != null) {
      return loadMoreExpenses(this);
    }
    return orElse();
  }
}

abstract class LoadMoreExpenses implements DashboardEvent {
  const factory LoadMoreExpenses() = _$LoadMoreExpensesImpl;
}

/// @nodoc
abstract class _$$RefreshExpensesImplCopyWith<$Res> {
  factory _$$RefreshExpensesImplCopyWith(_$RefreshExpensesImpl value,
          $Res Function(_$RefreshExpensesImpl) then) =
      __$$RefreshExpensesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshExpensesImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$RefreshExpensesImpl>
    implements _$$RefreshExpensesImplCopyWith<$Res> {
  __$$RefreshExpensesImplCopyWithImpl(
      _$RefreshExpensesImpl _value, $Res Function(_$RefreshExpensesImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshExpensesImpl implements RefreshExpenses {
  const _$RefreshExpensesImpl();

  @override
  String toString() {
    return 'DashboardEvent.refreshExpenses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshExpensesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return refreshExpenses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return refreshExpenses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (refreshExpenses != null) {
      return refreshExpenses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return refreshExpenses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return refreshExpenses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (refreshExpenses != null) {
      return refreshExpenses(this);
    }
    return orElse();
  }
}

abstract class RefreshExpenses implements DashboardEvent {
  const factory RefreshExpenses() = _$RefreshExpensesImpl;
}

/// @nodoc
abstract class _$$DeleteExpenseImplCopyWith<$Res> {
  factory _$$DeleteExpenseImplCopyWith(
          _$DeleteExpenseImpl value, $Res Function(_$DeleteExpenseImpl) then) =
      __$$DeleteExpenseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteExpenseImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DeleteExpenseImpl>
    implements _$$DeleteExpenseImplCopyWith<$Res> {
  __$$DeleteExpenseImplCopyWithImpl(
      _$DeleteExpenseImpl _value, $Res Function(_$DeleteExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteExpenseImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteExpenseImpl implements DeleteExpense {
  const _$DeleteExpenseImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'DashboardEvent.deleteExpense(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteExpenseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      __$$DeleteExpenseImplCopyWithImpl<_$DeleteExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadExpenses,
    required TResult Function(DateTime startDate, DateTime endDate)
        filterByDateRange,
    required TResult Function() filterByThisMonth,
    required TResult Function() filterByLast7Days,
    required TResult Function() loadMoreExpenses,
    required TResult Function() refreshExpenses,
    required TResult Function(String id) deleteExpense,
  }) {
    return deleteExpense(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadExpenses,
    TResult? Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult? Function()? filterByThisMonth,
    TResult? Function()? filterByLast7Days,
    TResult? Function()? loadMoreExpenses,
    TResult? Function()? refreshExpenses,
    TResult? Function(String id)? deleteExpense,
  }) {
    return deleteExpense?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadExpenses,
    TResult Function(DateTime startDate, DateTime endDate)? filterByDateRange,
    TResult Function()? filterByThisMonth,
    TResult Function()? filterByLast7Days,
    TResult Function()? loadMoreExpenses,
    TResult Function()? refreshExpenses,
    TResult Function(String id)? deleteExpense,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadExpenses value) loadExpenses,
    required TResult Function(FilterByDateRange value) filterByDateRange,
    required TResult Function(FilterByThisMonth value) filterByThisMonth,
    required TResult Function(FilterByLast7Days value) filterByLast7Days,
    required TResult Function(LoadMoreExpenses value) loadMoreExpenses,
    required TResult Function(RefreshExpenses value) refreshExpenses,
    required TResult Function(DeleteExpense value) deleteExpense,
  }) {
    return deleteExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadExpenses value)? loadExpenses,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
    TResult? Function(FilterByThisMonth value)? filterByThisMonth,
    TResult? Function(FilterByLast7Days value)? filterByLast7Days,
    TResult? Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult? Function(RefreshExpenses value)? refreshExpenses,
    TResult? Function(DeleteExpense value)? deleteExpense,
  }) {
    return deleteExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadExpenses value)? loadExpenses,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    TResult Function(FilterByThisMonth value)? filterByThisMonth,
    TResult Function(FilterByLast7Days value)? filterByLast7Days,
    TResult Function(LoadMoreExpenses value)? loadMoreExpenses,
    TResult Function(RefreshExpenses value)? refreshExpenses,
    TResult Function(DeleteExpense value)? deleteExpense,
    required TResult orElse(),
  }) {
    if (deleteExpense != null) {
      return deleteExpense(this);
    }
    return orElse();
  }
}

abstract class DeleteExpense implements DashboardEvent {
  const factory DeleteExpense(final String id) = _$DeleteExpenseImpl;

  String get id;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteExpenseImplCopyWith<_$DeleteExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
