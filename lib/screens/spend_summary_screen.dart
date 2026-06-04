import 'package:flutter/material.dart';
import '../models/transactions.dart';
import '../widgets/header_card.dart';
import '../widgets/category_scroll.dart';
import '../widgets/recent_transactions.dart';

class SpendSummaryScreen extends StatefulWidget {
  const SpendSummaryScreen({super.key});

  @override
  State<SpendSummaryScreen> createState() => _SpendSummaryScreenState();
}

class _SpendSummaryScreenState extends State<SpendSummaryScreen> {
  List<Transaction> transactions = [];

  // Mock monthly data
  final double currentMonthSpend = 2847.50;
  final double lastMonthSpend = 2650.75;

  double get percentChange {
    return ((currentMonthSpend - lastMonthSpend) / lastMonthSpend) * 100;
  }

  @override
  void initState() {
    super.initState();
    transactions = generateMockTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Spend Summary',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {
            transactions = generateMockTransactions();
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    HeaderCard(
                      currentSpend: currentMonthSpend,
                      percentChange: percentChange,
                    ),
                    const SizedBox(height: 24),
                     CategoryScroll(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Transactions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A2E),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(color: Color(0xFF6750A4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RecentTransactionsList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add new expense')),
          );
        },
        backgroundColor: const Color(0xFF6750A4),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}