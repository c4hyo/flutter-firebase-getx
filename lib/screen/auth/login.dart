import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/authController.dart';
import 'package:katalog/screen/auth/register.dart';
import 'package:katalog/screen/komponen/button.dart';
import 'package:katalog/utility/color.dart';
import 'package:katalog/utility/style.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pass = TextEditingController();
    final email = TextEditingController();
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
                        "Login",
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
                              judul: "Login",
                              fungsi: () async {
                                auth.loading.toggle();
                                auth.login(
                                  email: email.text.trim(),
                                  password: pass.text.trim(),
                                );
                                auth.setLoading(false);
                              },
                            ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Lupa Password ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => Register(),
                          );
                        },
                        child: Text(
                          "Registrasi Sekarang",
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
