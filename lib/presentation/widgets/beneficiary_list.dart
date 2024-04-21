import 'package:das_assignment/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:das_assignment/presentation/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiaryList extends StatelessWidget {
  BeneficiaryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<HomePageBloc>().state;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: state.user!.beneficiaries.length,
        itemBuilder: (context, index) {
          return ContactCard(beneficiary: state.user!.beneficiaries[index]);
        },
      ),
    );
  }
}
