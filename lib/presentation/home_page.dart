import 'package:das_assignment/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:das_assignment/presentation/widgets/beneficiary_list.dart';
import 'package:das_assignment/presentation/widgets/new_beneficiary_form.dart';
import 'package:das_assignment/presentation/widgets/rounded_tab_bar.dart';
import 'package:das_assignment/presentation/widgets/transaction_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Mobile Recharge',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state) {
          print('state changed $state');
          if (state is ShowMessage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is ShowVerificationDialog) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                        Text("Verify to increase your monthly spending limit"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context
                                .read<HomePageBloc>()
                                .add(VerifyUser(user: state.user!));
                          },
                          child: Text('Verify Now')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Nevermind')),
                    ],
                  );
                });
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              RoundedTabBar(tabController: tabController),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        print('state changed $state');
                        if (state is HomePageInitial) {
                          context.read<HomePageBloc>().add(Initialize());
                        }
                        if (state is HomePageIdle) {
                          return Column(
                            children: [
                              Spacer(),
                              const Text(
                                "Current Beneficiaries:",
                                style: TextStyle(fontSize: 20),
                              ),
                              BeneficiaryList(),
                              Spacer(),
                              NewBeneficiaryForm(),
                              Spacer(
                                flex: 10,
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.user!.transactions.length,
                            itemBuilder: ((context, index) {
                              return TransactionListTile(
                                  transaction: state.user!.transactions[index]);
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
