// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "../models/transaction.dart";

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction);

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameYear && sameMonth && sameDay) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay)[0],
        "value": totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return Text("${tr["day"]}: ${tr["value"]}");
        }).toList(),
      ),
    );
  }
}