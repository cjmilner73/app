class Post {
  final String id;
  final double price;
  final int amount;

  Post({required this.id, required this.price, required this.amount});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['bitcoin'] as String, price: json['price'] as double, amount: json['amount'] as int);
  }
}
