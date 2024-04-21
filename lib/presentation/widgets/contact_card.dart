import 'package:das_assignment/models/beneficiary.dart';
import 'package:das_assignment/presentation/widgets/credit_option_button.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Beneficiary beneficiary;
  const ContactCard({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.4,
      ),
      child: Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(beneficiary.name),
              Text(beneficiary.number),
              Text('Balance: ${beneficiary.balance}'),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheet(
                              onClosing: () {},
                              enableDrag: false,
                              builder: (context) {
                                return Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.0),
                                      child: Text(
                                        "Add Credit",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.spaceBetween,
                                      children: [
                                        CreditOptionButton(
                                            amount: 5,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 10,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 20,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 30,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 50,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 75,
                                            beneficiary: beneficiary),
                                        CreditOptionButton(
                                            amount: 100,
                                            beneficiary: beneficiary),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        });
                  },
                  child: const Text("Recharge Now"))
            ],
          )),
    );
  }
}
