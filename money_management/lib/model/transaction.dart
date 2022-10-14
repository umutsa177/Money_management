class Transaction {
  String title;
  double amount;
  String type; // inc: income - exp: expenditure

  Transaction({
    required this.title,
    required this.amount,
    required this.type,
  });
}
