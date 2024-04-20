import 'package:das_assignment/models/beneficiary.dart';
import 'package:das_assignment/models/transaction.dart';
import 'package:das_assignment/models/user.dart';

class UserRepository {
  UserRepository._();

  static final UserRepository _instance = UserRepository._();

  static UserRepository get instance => _instance;
  Transaction createTansaction(double amount, Beneficiary beneficiary) {
    // implement endpoint here
    return Transaction(beneficiary: beneficiary, amount: amount);
  }
}
