import 'package:flutter/material.dart';
import 'package:clima/model/customer_list.dart';

class CustomerDetails extends StatefulWidget {
  CustomerDetails({this.customer});

  final Customer customer;

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Small Retail"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "${widget.customer.firstName} ${widget.customer.lastName}",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            Text(
              widget.customer.seal,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.teal,
                child: Text("Create Order"),
              ),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton.icon(
                icon: Icon(Icons.phone),
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.teal,
                label: Text(widget.customer.phoneNumber),
              ),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.teal,
                child: Text("Bills"),
              ),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.teal,
                child: Text("Edit"),
              ),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.teal,
                child: Text("Delete"),
              ),
            ),
          ],
        ));
  }
}
