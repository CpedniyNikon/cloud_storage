import 'package:flutter/material.dart';
import 'package:web_service/global_variables/userdata.dart';
import 'package:web_service/storage/requests/getfiles.dart';
import 'package:web_service/storage/utils/widgets/upload_button.dart';

class FileUploadPage extends StatelessWidget {
  const FileUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const FileUploadButton(),
              FloatingActionButton(onPressed: () {
                getFiles(UserData.userId);
              })
            ],
          ),
        ),
      ),
    );
  }
}
