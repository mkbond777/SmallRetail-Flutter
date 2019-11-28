import 'package:clima/model/bill_list.dart';
import 'package:clima/model/customer_list.dart';
import 'package:clima/screens/bills_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

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
                onPressed: () async {
                  NetworkHelper networkHelper = NetworkHelper(
                      'https://smallretail.herokuapp.com/api/v1/bill');
                  BillList billList = new BillList.fromJson(
                      await networkHelper.getDataById(widget.customer.id));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BillsScreen(
                      billList: billList,
                    );
                  }));
                },
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
                onPressed: () async {
                  NetworkHelper networkHelper = NetworkHelper(
                      'https://smallretail.herokuapp.com/api/v1/customer');

                  bool isCustomerDeleted =
                      await networkHelper.deleteData(widget.customer.id);
                  if (isCustomerDeleted) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoadingScreen();
                    }));
                  } else
                    _showDialog(context);
                },
                textColor: Colors.white,
                color: Colors.teal,
                child: Text("Delete"),
              ),
            ),
          ],
        ));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Unable to delete customer')));
  }
}
