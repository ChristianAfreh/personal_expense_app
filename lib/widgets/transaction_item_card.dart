import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction_model.dart';

class TransactionItemCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;
  const TransactionItemCard({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontFamily: "QuickSand",
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: IconButton(
          onPressed: () => deleteTx(transaction.id),
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
