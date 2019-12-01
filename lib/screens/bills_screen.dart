import 'package:clima/model/bill_list.dart';
import 'package:clima/model/bill_products_list.dart';
import 'package:clima/screens/bill_detail_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillsScreen extends StatefulWidget {
  BillsScreen({this.billList});

  final BillList billList;

  @override
  _BillsScreenState createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Bills')),
        body: BodyLayout(
          bills: widget.billList.bills,
        ));
  }
}

class BodyLayout extends StatelessWidget {
  BodyLayout({this.bills});

  final List<Bill> bills;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        double remainingAmount =
            bills[index].totalAmount - bills[index].paidAmount;
        var formatter = new DateFormat('yyyy-MM-dd  hh:mm a');
        String formatted = formatter.format(bills[index].dateModified);
        return ListTile(
          title: Text("Total : ${(bills[index]).totalAmount}       "
              "Pending : $remainingAmount"),
          subtitle: Text("$formatted"),
          onTap: () async {
            NetworkHelper networkHelper = NetworkHelper(
                'https://smallretail.herokuapp.com/api/v1/billproduct');

            BillProductList billProductList = new BillProductList.fromJson(
                await networkHelper.getDataById(bills[index].id));

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BillDetails(billProductList: billProductList);
            }));
          },
        );
      },
    );
  }
}
