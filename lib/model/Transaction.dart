class Transaction {
  String name;
  String id;
  String upi;
  double amount = 0.0;
  DateTime date;
  Transaction(this.id, this.name, this.upi);
}
