import 'package:bloc/bloc.dart';
import 'package:das_assignment/models/beneficiary.dart';
import 'package:das_assignment/models/transaction.dart';
import 'package:das_assignment/models/user.dart';
import 'package:das_assignment/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(UserRepository userRepository) : super(const HomePageInitial()) {
    on<Initialize>((event, emit) async {
      emit(const HomePageLoading());
      User user = await User.fromJsonFile("assets/mock_user_data.json");
      emit(HomePageIdle(user: user));
    });

    on<AddBeneficiary>(
      (event, emit) async {
        Beneficiary duplicateBeneficiary = state.user!.beneficiaries
            .singleWhere((element) => element.number == event.number,
                orElse: () => Beneficiary(
                    totalRecharged: 0, name: 'null', number: '-1', balance: 0));
        if (duplicateBeneficiary.name != "null") {
          emit(ShowMessage(user: state.user, message: "Can't add duplicates"));
          emit(HomePageIdle(user: state.user));
        } else if (state.user!.beneficiaries.length >= 5) {
          emit(ShowMessage(
              user: state.user,
              message: "Can't add more than 5 beneficiaries"));
          emit(HomePageIdle(user: state.user));
        } else {
          User updatedUser = userRepository.addBeneficiary(
              name: event.name, number: event.number, user: state.user!);
          emit(ShowMessage(user: updatedUser, message: "added succescully"));
          emit(HomePageIdle(user: updatedUser));
        }
      },
    );

    on<AddCredit>(
      (event, emit) {
        if (event.user.balance < event.amount) {
          emit(ShowMessage(
              user: event.user, message: 'Not enough credit in your account'));
        } else if (event.user.monthlySpend + event.amount > 3000) {
          emit(ShowMessage(
              user: event.user, message: "monthly spend over the limit"));
        } else if ((event.user.isVerified &&
                event.beneficiary.totalRecharged + event.amount > 1000) ||
            (!event.user.isVerified &&
                event.beneficiary.totalRecharged + event.amount > 500)) {
          if (!event.user.isVerified) {
            emit(ShowVerificationDialog(user: event.user));
          } else {
            emit(ShowMessage(
                user: event.user,
                message:
                    "monthly spend for ${event.beneficiary.name} is over the limit"));
          }
        } else {
          User updatedUser =
              userRepository.updateUserBalance(event.user, -(event.amount + 1));
          updatedUser = userRepository.updateBeneficiaryBalance(
              user: event.user,
              beneficiary: event.beneficiary,
              amount: event.amount);
          updatedUser.transactions.add(
              userRepository.createTansaction(event.amount, event.beneficiary));
          emit(ShowMessage(
              user: updatedUser,
              message: "${event.amount} added to ${event.beneficiary.name}"));
          emit(HomePageIdle(user: updatedUser));
        }
      },
    );
  }
}
