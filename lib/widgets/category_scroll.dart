import 'package:flutter/material.dart';

class CategoryData {
  final String name;
  final String icon;
  final double amount;
  final Color color;

  const CategoryData({
    required this.name,
    required this.icon,
    required this.amount,
    required this.color,
  });
}

class CategoryScroll extends StatelessWidget {
  const CategoryScroll({super.key});

  static const List<CategoryData> categories = [
    CategoryData(name: 'Food', icon: '🍔', amount: 845.50, color: Color(0xFFFF6B6B)),
    CategoryData(name: 'Travel', icon: '✈️', amount: 620.00, color: Color(0xFF4ECDC4)),
    CategoryData(name: 'Shopping', icon: '🛍️', amount: 534.25, color: Color(0xFF45B7D1)),
    CategoryData(name: 'Entertainment', icon: '🎬', amount: 245.75, color: Color(0xFF96CEB4)),
    CategoryData(name: 'Bills', icon: '💡', amount: 412.00, color: Color(0xFFFFEAA7)),
    CategoryData(name: 'Healthcare', icon: '🏥', amount: 190.00, color: Color(0xFFDDA0DD)),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryScroll.categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final category = CategoryScroll.categories[index];
          return Container(
            width: 90,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: category.color.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    category.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '₹${category.amount.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}