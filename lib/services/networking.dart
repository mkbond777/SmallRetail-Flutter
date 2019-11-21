import 'dart:convert' as prefix0;

import 'package:clima/model/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(Map data) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    var body = json.encode(data);

    http.Response response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print("Customer creared");
    } else {
      print(response.statusCode);
    }
  }
}
