import 'dart:convert';

import 'package:http/http.dart' as http;

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

  Future getDataById(String id) async {
    String getUrl = "$url/$id";

    http.Response response = await http.get(getUrl);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(dynamic data) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    http.Response response = await http.Client()
        .post(url, headers: headers, body: json.encode(data));

    print(response.body);

    if (response.statusCode == 201) {
      print("Customer creared");
    } else {
      print(response.statusCode);
    }
  }

  Future deleteData(String id) async {
    String deleteUrl = "$url/$id";

    http.Response response = await http.delete(deleteUrl);

    print(response.body);

    if (response.statusCode == 204)
      return true;
    else
      return false;
  }
}
