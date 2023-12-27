class Product {
  int id;
  String name;
  double price;
  String image;

  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});

  // Add this in class Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }
}

class ProductCategory {
  String name;
  List<Product> products;

  ProductCategory({required this.name, required this.products});

  // Add this in class Category
  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return ProductCategory(name: json['name'] as String, products: products);
  }
}

class ItemInCart {
  Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}

class Note {
  String value;

  Note({required this.value});
}
