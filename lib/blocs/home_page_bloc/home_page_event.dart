part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {}

class AddBeneficiary extends HomePageEvent {
  final String name;
  final String number;

  AddBeneficiary({required this.name, required this.number});

  @override
  List<Object?> get props => [name, number];
}

class Initialize extends HomePageEvent {
  @override
  List<Object?> get props => [];
}

class AddCredit extends HomePageEvent {
  final int amount;
  final Beneficiary beneficiary;
  final User user;

  AddCredit(
      {required this.amount, required this.beneficiary, required this.user});

  @override
  List<Object?> get props => [user, amount, beneficiary];
}

class VerifyUser extends HomePageEvent {
  final User user;

  VerifyUser({required this.user});
  @override
  List<Object?> get props => [user];
}
