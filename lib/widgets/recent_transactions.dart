import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class RecentTransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const RecentTransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final transaction = transactions[index];
          final formatter = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
          final dateFormatter = DateFormat('MMM dd');

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  transaction.icon,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                '${transaction.category} • ${dateFormatter.format(transaction.date)}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              trailing: Text(
                formatter.format(transaction.amount),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: transaction.amount > 100 ? Colors.red.shade700 : Colors.green.shade700,
                ),
              ),
              isThreeLine: false,
              dense: false,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        },
        childCount: transactions.length,
      ),
    );
  }
}