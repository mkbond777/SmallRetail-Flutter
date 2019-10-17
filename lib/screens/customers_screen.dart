import 'package:clima/model/customer_list.dart';
import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  CustomersScreen({this.customers});

  final CustomerList customers;

  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    widget.customers.customers.forEach((f) => print(f.firstName));
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
        body: BodyLayout(
          customers: widget.customers,
        ),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout({this.customers});

  final CustomerList customers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.customers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text((customers.customers[index]).id),
        );
      },
    );
  }
}
