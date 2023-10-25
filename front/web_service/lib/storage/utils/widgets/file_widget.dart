import 'package:flutter/material.dart';
import 'package:web_service/storage/utils/File.dart';

class FileWidget extends StatelessWidget {
  late ValueChanged<File> callback;
  late File file;

  FileWidget({super.key, required this.callback, required this.file});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRect(
        child: InkWell(
          onTap: () {
            callback(file);
          },
          child: Row(
            children: [
              Expanded(
                child: Image.asset('images/file.png'),
              ),
              Expanded(
                child: Text(file.filename),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
