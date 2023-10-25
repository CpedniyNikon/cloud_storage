import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:web_service/storage/utils/File.dart';
import 'package:web_service/storage/utils/functions/download_file.dart';
import 'package:web_service/storage/utils/widgets/file_widget.dart';

getFiles(
    int userId, List<FileWidget> fileList, Function(VoidCallback f) callback) {
  debugPrint("getting files");
  var url = 'http://localhost:8090/store/get-files';
  http
      .post(Uri.parse(url),
          headers: {},
          body: json.encode({
            "userId": userId,
          }))
      .then((http.Response response) {
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.contentLength}");

    List<dynamic> parsedJson = json.decode(response.body);
    fileList.clear();
    for (var json in parsedJson) {
      File file = File();
      file.filename = json['name'];
      file.base64Data = json['data'];
      callback(() => fileList.add(FileWidget(
              callback: downloadFile,
              file: file,
            ))
          );
    }
    debugPrint("size is ${fileList.length}");
  });
}
