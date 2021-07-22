import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/authController.dart';
import 'package:katalog/kontroller/userController.dart';
import 'package:katalog/model/barangModel.dart';
import 'package:katalog/screen/komponen/card.dart';
import 'package:katalog/services/userServices.dart';
import 'package:katalog/utility/style.dart';

class BarangList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _hotKeyword = [
      "Accent Chairs",
      "Kitchen & dining Chairs",
      "Bar Stools",
      "Office Furniture",
      "Folding Chairs",
      "Stacting Chairs",
      "Living Room Furniture",
      "Reclening Sectionals",
      "Garden Chairs",
    ];
    final auth = Get.find<AuthController>();
    return GetBuilder<UserController>(
      init: UserController(),
      initState: (_) async {
        Get.find<UserController>().user = await UserServices()
            .getProfil(id: Get.find<AuthController>().user!.uid);
      },
      builder: (userC) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.white70,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                onPressed: () {
                  auth.logOut();
                },
              ),
            ],
            title: Obx(() {
              return Text(
                "${userC.user.nama}",
                style: TextStyle(color: Colors.black87),
              );
            }),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari Barang",
                    focusedBorder: inputAuth,
                    enabledBorder: inputAuth,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "Hot Keywords",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: _hotKeyword.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.black54,
                            ),
                          ),
                          onPressed: () {
                            print("$index");
                          },
                          child: Text(
                            "${_hotKeyword[index]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "Recent Search",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: listBarang.length,
                      itemBuilder: (context, index) {
                        return cardBarangAll(model: listBarang[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
