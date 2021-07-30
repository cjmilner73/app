class Post {
  final String id;
  final double price;

  Post({required this.id, required this.price});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['bitcoin'] as String, price: json['price'] as double);
  }
}
