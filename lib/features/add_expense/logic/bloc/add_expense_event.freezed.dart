// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_expense_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddExpenseEventCopyWith<$Res> {
  factory $AddExpenseEventCopyWith(
          AddExpenseEvent value, $Res Function(AddExpenseEvent) then) =
      _$AddExpenseEventCopyWithImpl<$Res, AddExpenseEvent>;
}

/// @nodoc
class _$AddExpenseEventCopyWithImpl<$Res, $Val extends AddExpenseEvent>
    implements $AddExpenseEventCopyWith<$Res> {
  _$AddExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CategoryChangedImplCopyWith<$Res> {
  factory _$$CategoryChangedImplCopyWith(_$CategoryChangedImpl value,
          $Res Function(_$CategoryChangedImpl) then) =
      __$$CategoryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$CategoryChangedImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$CategoryChangedImpl>
    implements _$$CategoryChangedImplCopyWith<$Res> {
  __$$CategoryChangedImplCopyWithImpl(
      _$CategoryChangedImpl _value, $Res Function(_$CategoryChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryChangedImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryChangedImpl implements CategoryChanged {
  const _$CategoryChangedImpl(this.category);

  @override
  final String category;

  @override
  String toString() {
    return 'AddExpenseEvent.categoryChanged(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryChangedImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      __$$CategoryChangedImplCopyWithImpl<_$CategoryChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return categoryChanged(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return categoryChanged?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return categoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return categoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(this);
    }
    return orElse();
  }
}

abstract class CategoryChanged implements AddExpenseEvent {
  const factory CategoryChanged(final String category) = _$CategoryChangedImpl;

  String get category;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AmountChangedImplCopyWith<$Res> {
  factory _$$AmountChangedImplCopyWith(
          _$AmountChangedImpl value, $Res Function(_$AmountChangedImpl) then) =
      __$$AmountChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$AmountChangedImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$AmountChangedImpl>
    implements _$$AmountChangedImplCopyWith<$Res> {
  __$$AmountChangedImplCopyWithImpl(
      _$AmountChangedImpl _value, $Res Function(_$AmountChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AmountChangedImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AmountChangedImpl implements AmountChanged {
  const _$AmountChangedImpl(this.amount);

  @override
  final String amount;

  @override
  String toString() {
    return 'AddExpenseEvent.amountChanged(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountChangedImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountChangedImplCopyWith<_$AmountChangedImpl> get copyWith =>
      __$$AmountChangedImplCopyWithImpl<_$AmountChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return amountChanged(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return amountChanged?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class AmountChanged implements AddExpenseEvent {
  const factory AmountChanged(final String amount) = _$AmountChangedImpl;

  String get amount;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AmountChangedImplCopyWith<_$AmountChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrencyChangedImplCopyWith<$Res> {
  factory _$$CurrencyChangedImplCopyWith(_$CurrencyChangedImpl value,
          $Res Function(_$CurrencyChangedImpl) then) =
      __$$CurrencyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currency});
}

/// @nodoc
class __$$CurrencyChangedImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$CurrencyChangedImpl>
    implements _$$CurrencyChangedImplCopyWith<$Res> {
  __$$CurrencyChangedImplCopyWithImpl(
      _$CurrencyChangedImpl _value, $Res Function(_$CurrencyChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
  }) {
    return _then(_$CurrencyChangedImpl(
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrencyChangedImpl implements CurrencyChanged {
  const _$CurrencyChangedImpl(this.currency);

  @override
  final String currency;

  @override
  String toString() {
    return 'AddExpenseEvent.currencyChanged(currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyChangedImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyChangedImplCopyWith<_$CurrencyChangedImpl> get copyWith =>
      __$$CurrencyChangedImplCopyWithImpl<_$CurrencyChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return currencyChanged(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return currencyChanged?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (currencyChanged != null) {
      return currencyChanged(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return currencyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return currencyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (currencyChanged != null) {
      return currencyChanged(this);
    }
    return orElse();
  }
}

abstract class CurrencyChanged implements AddExpenseEvent {
  const factory CurrencyChanged(final String currency) = _$CurrencyChangedImpl;

  String get currency;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyChangedImplCopyWith<_$CurrencyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateChangedImplCopyWith<$Res> {
  factory _$$DateChangedImplCopyWith(
          _$DateChangedImpl value, $Res Function(_$DateChangedImpl) then) =
      __$$DateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$DateChangedImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$DateChangedImpl>
    implements _$$DateChangedImplCopyWith<$Res> {
  __$$DateChangedImplCopyWithImpl(
      _$DateChangedImpl _value, $Res Function(_$DateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$DateChangedImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateChangedImpl implements DateChanged {
  const _$DateChangedImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'AddExpenseEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateChangedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateChangedImplCopyWith<_$DateChangedImpl> get copyWith =>
      __$$DateChangedImplCopyWithImpl<_$DateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class DateChanged implements AddExpenseEvent {
  const factory DateChanged(final DateTime date) = _$DateChangedImpl;

  DateTime get date;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateChangedImplCopyWith<_$DateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiptSelectedImplCopyWith<$Res> {
  factory _$$ReceiptSelectedImplCopyWith(_$ReceiptSelectedImpl value,
          $Res Function(_$ReceiptSelectedImpl) then) =
      __$$ReceiptSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? path});
}

/// @nodoc
class __$$ReceiptSelectedImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$ReceiptSelectedImpl>
    implements _$$ReceiptSelectedImplCopyWith<$Res> {
  __$$ReceiptSelectedImplCopyWithImpl(
      _$ReceiptSelectedImpl _value, $Res Function(_$ReceiptSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_$ReceiptSelectedImpl(
      freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReceiptSelectedImpl implements ReceiptSelected {
  const _$ReceiptSelectedImpl(this.path);

  @override
  final String? path;

  @override
  String toString() {
    return 'AddExpenseEvent.receiptSelected(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptSelectedImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptSelectedImplCopyWith<_$ReceiptSelectedImpl> get copyWith =>
      __$$ReceiptSelectedImplCopyWithImpl<_$ReceiptSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return receiptSelected(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return receiptSelected?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (receiptSelected != null) {
      return receiptSelected(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return receiptSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return receiptSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (receiptSelected != null) {
      return receiptSelected(this);
    }
    return orElse();
  }
}

abstract class ReceiptSelected implements AddExpenseEvent {
  const factory ReceiptSelected(final String? path) = _$ReceiptSelectedImpl;

  String? get path;

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptSelectedImplCopyWith<_$ReceiptSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveExpenseImplCopyWith<$Res> {
  factory _$$SaveExpenseImplCopyWith(
          _$SaveExpenseImpl value, $Res Function(_$SaveExpenseImpl) then) =
      __$$SaveExpenseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveExpenseImplCopyWithImpl<$Res>
    extends _$AddExpenseEventCopyWithImpl<$Res, _$SaveExpenseImpl>
    implements _$$SaveExpenseImplCopyWith<$Res> {
  __$$SaveExpenseImplCopyWithImpl(
      _$SaveExpenseImpl _value, $Res Function(_$SaveExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SaveExpenseImpl implements SaveExpense {
  const _$SaveExpenseImpl();

  @override
  String toString() {
    return 'AddExpenseEvent.saveExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveExpenseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) categoryChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String currency) currencyChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String? path) receiptSelected,
    required TResult Function() saveExpense,
  }) {
    return saveExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String amount)? amountChanged,
    TResult? Function(String currency)? currencyChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String? path)? receiptSelected,
    TResult? Function()? saveExpense,
  }) {
    return saveExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? categoryChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String currency)? currencyChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String? path)? receiptSelected,
    TResult Function()? saveExpense,
    required TResult orElse(),
  }) {
    if (saveExpense != null) {
      return saveExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryChanged value) categoryChanged,
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(CurrencyChanged value) currencyChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(ReceiptSelected value) receiptSelected,
    required TResult Function(SaveExpense value) saveExpense,
  }) {
    return saveExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryChanged value)? categoryChanged,
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(CurrencyChanged value)? currencyChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(ReceiptSelected value)? receiptSelected,
    TResult? Function(SaveExpense value)? saveExpense,
  }) {
    return saveExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryChanged value)? categoryChanged,
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(CurrencyChanged value)? currencyChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(ReceiptSelected value)? receiptSelected,
    TResult Function(SaveExpense value)? saveExpense,
    required TResult orElse(),
  }) {
    if (saveExpense != null) {
      return saveExpense(this);
    }
    return orElse();
  }
}

abstract class SaveExpense implements AddExpenseEvent {
  const factory SaveExpense() = _$SaveExpenseImpl;
}
