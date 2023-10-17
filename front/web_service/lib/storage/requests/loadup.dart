import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> upload(String name, String data, int userId) async {
  debugPrint("upload");
  var url = 'http://localhost:8090/store/up-load';
  await http
      .post(Uri.parse(url),
      headers: {},
      body: json.encode({
        "name": name,
        "data": data,
        "userId": userId
      }))
      .then((http.Response response) {
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.contentLength}");
    debugPrint(response.body);
  });
}