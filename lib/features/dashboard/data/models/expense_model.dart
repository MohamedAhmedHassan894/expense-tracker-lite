import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class ExpenseModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String currency;

  @HiveField(4)
  final double amountInUSD;

  @HiveField(5)
  final DateTime date;

  @HiveField(6)
  final String? receiptPath;

  @HiveField(7)
  final DateTime createdAt;

  ExpenseModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.currency,
    required this.amountInUSD,
    required this.date,
    this.receiptPath,
    required this.createdAt,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  ExpenseModel copyWith({
    String? id,
    String? category,
    double? amount,
    String? currency,
    double? amountInUSD,
    DateTime? date,
    String? receiptPath,
    DateTime? createdAt,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      amountInUSD: amountInUSD ?? this.amountInUSD,
      date: date ?? this.date,
      receiptPath: receiptPath ?? this.receiptPath,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
