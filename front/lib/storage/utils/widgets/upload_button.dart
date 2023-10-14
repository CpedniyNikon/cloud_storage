import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

import 'package:front/storage/utils/functions/downloadFile.dart';

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({super.key});

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
              downloadFile(base64Image, file.name);
            });
            reader.readAsArrayBuffer(file);
          }
        });
      },
    );
  }
}
