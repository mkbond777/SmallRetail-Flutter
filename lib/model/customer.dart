import 'package:clima/services/networking.dart';

class CustomerAddForm {
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String seal = '';

  CustomerAddForm({this.firstName, this.lastName, this.phoneNumber, this.seal});

  save() {
    NetworkHelper networkHelper =
        NetworkHelper('https://smallretail.herokuapp.com/api/v1/customer');

    final dataTest = {
      'first_name': firstName,
      'last_name': lastName,
      'seal': seal,
      'phone_number': phoneNumber
    };

    networkHelper.postData(dataTest);

    //print('saving user using a web service : $json');
  }
}
