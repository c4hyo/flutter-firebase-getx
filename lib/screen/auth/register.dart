import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/authController.dart';
import 'package:katalog/screen/komponen/button.dart';
import 'package:katalog/utility/color.dart';
import 'package:katalog/utility/style.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();
    final nama = TextEditingController();
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (auth) {
        return Scaffold(
          backgroundColor: blueNavy,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(280, 170),
                        bottomRight: Radius.elliptical(280, 170),
                      ),
                    ),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        radius: 50,
                        child: FlutterLogo(
                          size: 75,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: nama,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        hintText: "Nama Lengkap",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: inputAuth,
                        focusedBorder: inputAuth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: inputAuth,
                        focusedBorder: inputAuth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: pass,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 40,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: inputAuth,
                        focusedBorder: inputAuth,
                      ),
                    ),
                  ),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        right: 15,
                        left: 15,
                        bottom: 15,
                      ),
                      child: (auth.loading.value)
                          ? Container(
                              height: 60,
                              width: double.infinity,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : buttonAuth(
                              judul: "Register",
                              fungsi: () {
                                auth.loading.toggle();
                                auth.registrasi(
                                  email: email.text,
                                  password: pass.text,
                                  nama: nama.text,
                                );
                                auth.setLoading(false);
                                Get.back();
                              },
                            ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Sudah punya akun, balik login lur",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
