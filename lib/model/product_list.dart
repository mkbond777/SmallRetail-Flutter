class ProductList {
  final List<Product> products;

  ProductList({
    this.products,
  });

  factory ProductList.fromJson(List<dynamic> parsedJson) {
    List<Product> products = new List<Product>();
    products = parsedJson.map((i) => Product.fromJson(i)).toList();

    return new ProductList(products: products);
  }
}

class Product {
  final String id;
  final String name;
  final String productType;
  final String description;

  Product({
    this.id,
    this.name,
    this.productType,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
        id: json['id'].toString(),
        name: json['name'],
        productType: json['p_type'],
        description: json['description']);
  }
}
