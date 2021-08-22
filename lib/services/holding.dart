class Holding {
  final String name;
  final String id;
  final int amount;

  Holding({required this.name, required this.id, required this.amount});

  factory Holding.fromJson(Map<String, dynamic> json) {
    return Holding(
        name: json['dummy'], id: json['dummy-name'], amount: json[0]);
  }
}
