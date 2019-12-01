class BillList {
  final List<Bill> bills;

  BillList({
    this.bills,
  });

  factory BillList.fromJson(List<dynamic> parsedJson) {
    List<Bill> bills = new List<Bill>();
    bills = parsedJson.map((i) => Bill.fromJson(i)).toList();

    return new BillList(bills: bills);
  }
}

class Bill {
  final String id;
  final String custId;
  final DateTime dateCreated;
  final DateTime dateModified;
  final double totalAmount;
  final double paidAmount;

  Bill(
      {this.id,
      this.custId,
      this.dateCreated,
      this.dateModified,
      this.totalAmount,
      this.paidAmount});

  factory Bill.fromJson(Map<String, dynamic> json) {
    return new Bill(
        id: json['id'].toString(),
        custId: json['cust_id'],
        dateCreated: DateTime.parse(json['date_created']),
        dateModified: DateTime.parse(json['date_modified']),
        totalAmount: json['total_amount'].toDouble(),
        paidAmount: json['paid_amount'].toDouble());
  }
}
