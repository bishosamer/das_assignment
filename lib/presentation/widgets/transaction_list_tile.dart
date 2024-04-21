import 'package:das_assignment/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionListTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionListTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.beneficiary.name),
      subtitle: Text('${transaction.amount}'),
    );
  }
}
