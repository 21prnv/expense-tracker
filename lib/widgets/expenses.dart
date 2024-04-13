import 'package:expense_tracker/model/expense_str.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regidteredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 11.23,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 14.20,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _getBottomModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _saveExpense,
            ));
  }

  void _saveExpense(Expense expense) {
    setState(() {
      _regidteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndexx = _regidteredExpenses.indexOf(expense);
    setState(() {
      _regidteredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense is deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _regidteredExpenses.insert(expenseIndexx, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expense is found'),
    );

    if (_regidteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _regidteredExpenses,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _getBottomModal, icon: const Icon(Icons.add))
        ],
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Chart(expenses: _regidteredExpenses),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
