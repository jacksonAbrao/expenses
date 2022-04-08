import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: "t1",
        title: "Novo Tênis teste",
        value: 310.70,
        date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t4",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t5",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t6",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t7",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t8",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t9",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t10",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t11",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
    Transaction(
        id: "t12",
        title: "Conta de Energia",
        value: 210.50,
        date: DateTime.now()),
  ];

  _addTransiction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransiction),
        TransactionList(_transactions),
      ],
    );
  }
}
