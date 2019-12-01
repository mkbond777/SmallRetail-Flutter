import 'package:clima/model/product_list.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({this.productsList});

  final ProductList productsList;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController editingController = TextEditingController();

  var items = List<Product>();

  @override
  void initState() {
    items.addAll(widget.productsList.products);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Product> dummySearchList = List<Product>();
    dummySearchList.addAll(widget.productsList.products);

    if (query.isNotEmpty) {
      List<Product> dummyListData = List<Product>();
      dummySearchList.forEach((item) {
        if (item.name.toUpperCase().contains(query.toUpperCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(widget.productsList.products);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Product Name",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: BodyLayout(
                  products: items,
                ),
              )
            ],
          ),
        ));
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout({this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
            title: Text("${(products[index]).name}"),
            children: <Widget>[
              Column(
                children: <Widget>[Text("Unit"), Text("Quantity")],
              )
            ]);
      },
    );
  }
}
