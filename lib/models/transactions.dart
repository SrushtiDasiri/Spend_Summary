
class Transaction {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final String icon;

  Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.icon,
  });
}

List<Transaction> generateMockTransactions() {
  final categories = [
    ('Food', '🍔'),
    ('Travel', '✈️'),
    ('Shopping', '🛍️'),
    ('Entertainment', '🎬'),
    ('Bills', '💡'),
    ('Healthcare', '🏥'),
  ];

  final titles = [
    'Starbucks Coffee', 'Uber Ride', 'Amazon Purchase',
    'Netflix Subscription', 'Electricity Bill', 'Grocery Store',
    'Flight Ticket', 'New Shoes', 'Movie Tickets', 'Gym Membership',
    'Restaurant Dinner', 'Taxi Ride', 'Clothing Store', 'Spotify Premium',
    'Phone Bill', 'Pharmacy', 'Book Store', 'Fast Food'
  ];

  return List.generate(57, (index) {
    final category = categories[index % categories.length];
    return Transaction(
      id: index.toString(),
      title: titles[index % titles.length],
      category: category.$1,
      amount: 12.99 + (index * 3.45) % 500,
      date: DateTime(2026, 5, (index % 30) + 1),
      icon: category.$2,
    );
  });
}