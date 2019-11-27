import 'package:clima/model/customer_list.dart';
import 'package:clima/screens/customers_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCustomers();
  }

  void getCustomers() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://smallretail.herokuapp.com/api/v1/customer');

    CustomerList customerList =
        new CustomerList.fromJson(await networkHelper.getData());

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CustomersScreen(
        customersList: customerList,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
