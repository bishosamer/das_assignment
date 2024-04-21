import 'package:hive/hive.dart';

part 'beneficiary.g.dart';

@HiveType(typeId: 0)
class Beneficiary {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final int balance;

  @HiveField(3)
  final int totalRecharged;

  Beneficiary({
    required this.totalRecharged,
    required this.name,
    required this.number,
    required this.balance,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      name: json['name'],
      number: json['number'],
      balance: json['balance'],
      totalRecharged: json['totalRecharged'],
    );
  }
}
