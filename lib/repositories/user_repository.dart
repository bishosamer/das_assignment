import 'package:das_assignment/models/beneficiary.dart';
import 'package:das_assignment/models/transaction.dart';
import 'package:das_assignment/models/user.dart';

class UserRepository {
  UserRepository._();

  static final UserRepository _instance = UserRepository._();

  static UserRepository get instance => _instance;
  Transaction createTansaction(int amount, Beneficiary beneficiary) {
    // implement endpoint here
    return Transaction(beneficiary: beneficiary, amount: amount);
  }

  User updateUserBalance(User user, int amount) {
    // implement endpoint here

    return User(
        balance: user.balance + amount,
        isVerified: user.isVerified,
        monthlySpend: user.monthlySpend + amount,
        beneficiaries: user.beneficiaries,
        transactions: user.transactions);
  }

  User updateBeneficiaryBalance(
      {required User user,
      required Beneficiary beneficiary,
      required int amount}) {
    user.beneficiaries[user.beneficiaries
            .indexWhere((element) => element.number == beneficiary.number)] =
        Beneficiary(
            totalRecharged: beneficiary.totalRecharged + amount,
            name: beneficiary.name,
            number: beneficiary.number,
            balance: beneficiary.balance + amount);

    return user;
  }

  User addBeneficiary(
      {required String name, required String number, required User user}) {
    //implement endpoint here
    user.beneficiaries.add(
        Beneficiary(totalRecharged: 0, name: name, number: number, balance: 0));
    return user;
  }

  User verifyUser(User user) {
    // implement endpoint here
    return User(
        balance: user.balance,
        isVerified: true,
        monthlySpend: user.monthlySpend,
        beneficiaries: user.beneficiaries,
        transactions: user.transactions);
  }
}
