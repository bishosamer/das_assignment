import 'package:das_assignment/blocs/home_page_bloc/home_page_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NewBeneficiaryForm extends StatelessWidget {
  NewBeneficiaryForm({
    super.key,
  });
  final formKey = GlobalKey<FormState>();
  late String number, name;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Add a new beneficiary',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      required maxLength}) =>
                  null,
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onSaved: (value) {
                if (value != null) name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter beneficiary name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onSaved: (value) {
                if (value != null) number = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter beneficiary number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context
                      .read<HomePageBloc>()
                      .add(AddBeneficiary(name: name, number: number));
                }
              },
              child: const Text('Add New Beneficiary'))
        ],
      ),
    );
  }
}
