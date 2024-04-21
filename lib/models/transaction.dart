import 'package:hive/hive.dart';
import 'beneficiary.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final Beneficiary beneficiary;

  @HiveField(1)
  final int amount;

  Transaction({
    required this.beneficiary,
    required this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      beneficiary: Beneficiary.fromJson(json['beneficiary']),
      amount: json['amount'],
    );
  }
}
