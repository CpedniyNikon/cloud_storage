import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_service/global_variables/userdata.dart';
import 'package:web_service/storage/requests/get_files.dart';
import 'package:web_service/storage/requests/upload.dart';
import 'package:web_service/storage/utils/widgets/file_widget.dart';


class FileUploadButton extends StatelessWidget {
  final List<FileWidget> fileWidgets;
  final Function(VoidCallback f) pageCallback;
  const FileUploadButton({super.key, required this.fileWidgets, required this.pageCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('upload files'),
      onPressed: () async {
        var uploadInput = html.FileUploadInputElement();
        uploadInput.click();
        uploadInput.onChange.listen((e) {
          final files = uploadInput.files;
          if (files?.length == 1) {
            final file = files!.first;
            html.FileReader reader = html.FileReader();
            reader.onLoadEnd.listen((e) {
              var uploadedImage = reader.result as Uint8List;
              String base64Image = base64Encode(uploadedImage);
              upload(file.name, base64Image, UserData.userId, pageCallback, fileWidgets);
            });
            reader.readAsArrayBuffer(file);
          }
        });
      },
    );
  }
}
