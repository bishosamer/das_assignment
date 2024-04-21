import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'beneficiary.dart';
import 'transaction.dart';

part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  final int balance;

  @HiveField(1)
  final List<Beneficiary> beneficiaries;

  @HiveField(2)
  final List<Transaction> transactions;

  @HiveField(3)
  final int monthlySpend;

  @HiveField(4)
  final bool isVerified;

  User({
    required this.balance,
    required this.isVerified,
    required this.monthlySpend,
    required this.beneficiaries,
    required this.transactions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<Beneficiary> beneficiaries = [];
    if (json['beneficiaries'] != null) {
      json['beneficiaries'].forEach((beneficiaryJson) {
        beneficiaries.add(Beneficiary.fromJson(beneficiaryJson));
      });
    }

    List<Transaction> transactions = [];
    if (json['transactions'] != null) {
      json['transactions'].forEach((transactionJson) {
        transactions.add(Transaction(
            amount: transactionJson['amount'],
            beneficiary: beneficiaries.firstWhere(
                (element) => element.name == transactionJson['beneficiary'])));
      });
    }

    return User(
      balance: json['balance'],
      isVerified: json['isVerified'],
      monthlySpend: json['monthlySpend'],
      beneficiaries: beneficiaries,
      transactions: transactions,
    );
  }

  static Future<User> fromJsonFile(String fileName) async {
    String jsonString = await rootBundle.loadString(fileName);

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    return User.fromJson(jsonMap['user']);
  }
}
