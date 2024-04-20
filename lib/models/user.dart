import 'package:das_assignment/models/beneficiary.dart';
import 'package:das_assignment/models/transaction.dart';

class User {
  final double balance;
  final List<Beneficiary> beneficiaries;
  final List<Transaction> transactions;
  final double monthlySpend;
  final bool isVerified;
  User({
    required this.balance,
    required this.isVerified,
    required this.monthlySpend,
    required this.beneficiaries,
    required this.transactions,
  });
}
