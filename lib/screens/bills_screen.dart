import 'package:clima/model/bill_list.dart';
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
        );
      },
    );
  }
}
