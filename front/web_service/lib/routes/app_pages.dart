import 'package:web_service/routes/routes.dart';
import 'package:web_service/auth/login_page.dart';
import 'package:web_service/auth/register_page.dart';
import 'package:web_service/storage/upload_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.chat,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.storage,
      page: () => const FileUploadPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
    ),
  ];
}
