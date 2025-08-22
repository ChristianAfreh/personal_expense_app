import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction_model.dart';
import 'package:personal_expense_app/widgets/add_transaction_card.dart';
import 'package:personal_expense_app/widgets/chart_card.dart';
import 'package:personal_expense_app/widgets/transactionlist_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //   List<Transaction> _userTransactions = [
  //   Transaction(
  //     id: '1',
  //     title: 'New Shoes',
  //     amount: 10.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: '2',
  //     title: 'New Shirts',
  //     amount: 20.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: '3',
  //     title: 'New Watches',
  //     amount: 15.99,
  //     date: DateTime.now(),
  //   ),
  // ];

  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddTransactionCard(addTx: _addNewTransaction),
        );
      },
    );
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add, color: Colors.white),
            iconSize: 24.0,
          ),
        ],
        elevation: 20.0,
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChartCard(recentTransactions: _recentTransactions),
            TransactionlistCard(
              transactions: _userTransactions,
              deleteTx: _deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
