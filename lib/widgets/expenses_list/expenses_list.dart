import 'package:expense_tracker/model/expense_str.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          ),
          child: ExpensesItem(expenses[index])),
    );
  }
}
