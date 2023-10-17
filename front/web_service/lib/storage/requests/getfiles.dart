import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_service/storage/utils/File.dart';
import 'package:web_service/storage/utils/functions/downloadFile.dart';



Future<void> getFiles(int userId) async {
  debugPrint("getting files");
  var url = 'http://localhost:8090/store/get-files';
  await http
      .post(Uri.parse(url),
      
      headers: {},
      body: json.encode({
        "userId": userId,
      }))
      .then((http.Response response) {
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.contentLength}");
    debugPrint(response.body);

    List<dynamic> parsedJson=  json.decode(response.body);
    for (var json in parsedJson) {
      File file = File();
      file.filename = json['name'];
      file.base64Data = json['data'];
      downloadFile(file);
    }
  });
}