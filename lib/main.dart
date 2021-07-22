import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katalog/kontroller/authController.dart';
import 'package:katalog/kontroller/userController.dart';
import 'package:katalog/screen/auth/login.dart';
import 'package:katalog/screen/main/barangList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController(),
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return BarangList();
        } else {
          return Login();
        }
      },
    );
  }
}

