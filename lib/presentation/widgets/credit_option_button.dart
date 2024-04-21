import 'package:das_assignment/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:das_assignment/models/beneficiary.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditOptionButton extends StatelessWidget {
  final int amount;
  final Beneficiary beneficiary;
  const CreditOptionButton(
      {super.key, required this.amount, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(
                        "Confirm $amount to ${beneficiary.name}'s account"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.read<HomePageBloc>().add(AddCredit(
                                amount: amount,
                                beneficiary: beneficiary,
                                user:
                                    context.read<HomePageBloc>().state.user!));
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Confirm",
                            style: TextStyle(color: Colors.blue),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Nevermind",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ));
        },
        child: Text('$amount AED'),
      ),
    );
  }
}
