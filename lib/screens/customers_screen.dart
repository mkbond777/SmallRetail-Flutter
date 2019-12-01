import 'package:clima/model/customer_list.dart';
import 'package:clima/screens/customer_add.dart';
import 'package:clima/screens/customer_detail_screen.dart';
import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  CustomersScreen({this.customersList});

  final CustomerList customersList;

  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  TextEditingController editingController = TextEditingController();

  var items = List<Customer>();

  @override
  void initState() {
    items.addAll(widget.customersList.customers);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Customer> dummySearchList = List<Customer>();
    dummySearchList.addAll(widget.customersList.customers);

    if (query.isNotEmpty) {
      List<Customer> dummyListData = List<Customer>();
      dummySearchList.forEach((item) {
        if (item.firstName.toUpperCase().contains(query.toUpperCase())) {
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
        items.addAll(widget.customersList.customers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Customers')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomerAdd();
              }));
            },
            child: Icon(
              Icons.add,
            ),
            mini: true,
          ),
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
                        hintText: "Customer First Name",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: BodyLayout(
                    customers: items,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout({this.customers});

  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              "${(customers[index]).firstName} ${(customers[index]).lastName}"),
          subtitle: Text("${(customers[index]).phoneNumber}"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CustomerDetails(customer: customers[index]);
            }));
          },
        );
      },
    );
  }
}
