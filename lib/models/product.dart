class Product {
  int id;
  String title;
  String description;
  num price;
  String image;
  int quantitiy;
  bool isAddedtoCart;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.quantitiy,
    required this.isAddedtoCart,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      quantitiy: 0,
      isAddedtoCart: false,
    );
  }
}
