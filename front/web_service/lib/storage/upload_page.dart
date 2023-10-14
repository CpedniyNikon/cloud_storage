import 'package:flutter/material.dart';
import 'package:web_service/storage/utils/widgets/upload_button.dart';

class FileUploadPage extends StatelessWidget {
  const FileUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FileUploadButton(),
    );
  }
}
