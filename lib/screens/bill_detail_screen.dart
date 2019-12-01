import 'package:clima/model/bill_products_list.dart';
import 'package:flutter/material.dart';

class BillDetails extends StatefulWidget {
  BillDetails({this.billProductList});

  final BillProductList billProductList;

  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Small Retail"),
        ),
        body: BodyLayout(
          billProduct: widget.billProductList.billProducts,
        ));
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout({this.billProduct});

  final List<BillProduct> billProduct;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: billProduct.length,
      itemBuilder: (context, index) {
        double totalPrice =
            billProduct[index].quantity * billProduct[index].price;
        return ListTile(
          title: Text("$totalPrice      "
              "${billProduct[index].product.name.toUpperCase()}  "
              "${billProduct[index].unit.name.toUpperCase()}"),
          trailing: Text(" ${billProduct[index].quantity}"),
//          leading: Text("$totalPrice"),
        );
      },
    );
  }
}
