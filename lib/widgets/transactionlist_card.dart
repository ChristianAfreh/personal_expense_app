import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction_model.dart';
import 'package:personal_expense_app/widgets/transaction_item_card.dart';

class TransactionlistCard extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionlistCard({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  @override
  State<TransactionlistCard> createState() => _TransactionlistCardState();
}

class _TransactionlistCardState extends State<TransactionlistCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 500.0,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          var transactionItem = widget.transactions[index];
          return TransactionItemCard(
            transaction: transactionItem,
            deleteTx: widget.deleteTx,
          );
        },
        itemCount: widget.transactions.length,
      ),
    );
  }
}
