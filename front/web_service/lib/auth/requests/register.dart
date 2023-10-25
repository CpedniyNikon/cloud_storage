import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> register(String login, String password) async {
  debugPrint("login");
  var url = 'http://localhost:8080/auth/sign-up';
  await http
      .post(Uri.parse(url),
      headers: {},
      body: json.encode({
        "login": login,
        "password": password,
      }))
      .then((http.Response response) {
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.contentLength}");
    debugPrint(response.body);
  });
}