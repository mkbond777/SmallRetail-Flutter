import 'package:clima/model/product_list.dart';
import 'package:clima/model/unit_list.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({this.productsList});

  final ProductList productsList;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController editingController = TextEditingController();

  List<DropdownMenuItem<Unit>> _dropdownMenuItems;
  Unit _selectedUnit;

  var products = List<Product>();

  @override
  void initState() {
    getUnits();
    products.addAll(widget.productsList.products);
    super.initState();
  }

  void getUnits() async {
    _dropdownMenuItems = await buildDropdownMenuItems();
    _selectedUnit = _dropdownMenuItems[0].value;
  }

  Future<List<DropdownMenuItem<Unit>>> buildDropdownMenuItems() async {
    List<DropdownMenuItem<Unit>> items = List();

    NetworkHelper networkHelper =
        NetworkHelper('https://smallretail.herokuapp.com/api/v1/unit');

    UnitList units = new UnitList.fromJson(await networkHelper.getData());

    for (Unit unit in units.units) {
      items.add(
        DropdownMenuItem(
          value: unit,
          child: Text(unit.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Unit selectedUnit) {
    setState(() {
      _selectedUnit = selectedUnit;
    });
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
        products.clear();
        products.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        products.clear();
        products.addAll(widget.productsList.products);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Container(
        child: Column(children: <Widget>[
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
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                    title: Text("${(products[index]).name}"),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          DropdownButton(
                            value: _selectedUnit,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropdownItem,
                          ),
                        ],
                      )
                    ]);
              },
            ),
          )
        ]),
      ),
    );
  }
}

//class BodyLayout extends StatelessWidget {
//  BodyLayout({this.products});
//
//  final List<Product> products;
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemCount: products.length,
//      itemBuilder: (context, index) {
//        return ExpansionTile(
//            title: Text("${(products[index]).name}"),
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  DropdownButton(
//                    value: _selectedUnit,
//                    items: _dropdownMenuItems,
//                    onChanged: onChangeDropdownItem,
//                  ),
//                  Text("Quantity")
//                ],
//              )
//            ]);
//      },
//    );
//  }
//}
