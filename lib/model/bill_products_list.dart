import 'package:clima/model/product_list.dart';
import 'package:clima/model/unit_list.dart';

class BillProductList {
  final List<BillProduct> billProducts;

  BillProductList({
    this.billProducts,
  });

  factory BillProductList.fromJson(List<dynamic> parsedJson) {
    List<BillProduct> billProducts = new List<BillProduct>();
    billProducts = parsedJson.map((i) => BillProduct.fromJson(i)).toList();

    return new BillProductList(billProducts: billProducts);
  }
}

class BillProduct {
  final String billId;
  final Product product;
  final Unit unit;
  final int quantity;
  final double price;

  BillProduct(
      {this.billId, this.product, this.unit, this.quantity, this.price});

  factory BillProduct.fromJson(Map<String, dynamic> json) {
    return new BillProduct(
        billId: json['bill_id'],
        product: new Product.fromJson(json['product']),
        unit: new Unit.fromJson(json['unit']),
        quantity: json['quantity'],
        price: json['price'].toDouble());
  }
}
