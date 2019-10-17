class CustomerList {
  final List<Customer> customers;

  CustomerList({
    this.customers,
  });

  factory CustomerList.fromJson(List<dynamic> parsedJson) {
    List<Customer> customers = new List<Customer>();
    customers = parsedJson.map((i) => Customer.fromJson(i)).toList();

    return new CustomerList(customers: customers);
  }
}

class Customer {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String seal;

  Customer(
      {this.id, this.firstName, this.lastName, this.phoneNumber, this.seal});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return new Customer(
        id: json['id'].toString(),
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_number'],
        seal: json['seal']);
  }
}
