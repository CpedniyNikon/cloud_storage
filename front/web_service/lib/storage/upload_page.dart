import 'package:flutter/material.dart';
import 'package:web_service/global_variables/userdata.dart';
import 'package:web_service/storage/requests/get_files.dart';
import 'package:web_service/storage/utils/widgets/file_widget.dart';
import 'package:web_service/storage/utils/widgets/upload_button.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  List<FileWidget> files = [];

  callback(VoidCallback f) {
    setState(() {
      f();
    });
  }

  @override
  void initState() {
    getFiles(UserData.userId, files, callback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...files,
            Center(
              child: FileUploadButton(
                fileWidgets: files,
                pageCallback: callback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
