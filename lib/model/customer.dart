import 'package:clima/services/networking.dart';

class CustomerAddForm {
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String seal = '';

  CustomerAddForm({this.firstName, this.lastName, this.phoneNumber, this.seal});

  save(Map data) {
    NetworkHelper networkHelper =
        NetworkHelper('https://smallretail.herokuapp.com/api/v1/customer');

    networkHelper.postData(data);

    //print('saving user using a web service : $json');
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone_numebr'] = phoneNumber;
    map['seal'] = seal;
    return map;
  }
}
