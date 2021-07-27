import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/authController.dart';
import 'package:katalog/kontroller/userController.dart';
import 'package:katalog/model/barangModel.dart';
import 'package:katalog/screen/komponen/card.dart';
import 'package:katalog/screen/main/addBarang.dart';
import 'package:katalog/services/barangServices.dart';
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
                onPressed: () => Get.to(AddBarang()),
                icon: Icon(Icons.add,color: Colors.black,),
              ),
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.defaultDialog(
                    title: "Konfirmasi",
                    middleText: "Log Out",
                    barrierDismissible: false,
                    cancel: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text("Tidak"),
                    ),
                    confirm: ElevatedButton(
                      onPressed: () {
                        auth.logOut();
                      },
                      child: Text("Ya"),
                    ),
                  );
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
              child: StreamBuilder<QuerySnapshot>(
                stream: BarangServices.barang.snapshots(),
                builder: (_,snapshot){
                  if(!snapshot.hasData){
                    return Center(child: Text("Tidak ada barang"),);
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_,index){
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      BarangModel model = BarangModel.docSnapshot(doc);
                      return cardBarangAll(model: model);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
