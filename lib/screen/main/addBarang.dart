import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katalog/kontroller/barangController.dart';
import 'package:katalog/kontroller/utilityController.dart';
import 'package:katalog/model/barangModel.dart';
import 'package:katalog/services/barangServices.dart';
import 'package:katalog/services/storageServices.dart';

class AddBarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final upload = Get.put<UtilityController>(UtilityController());
    final barang = Get.put<BarangController>(BarangController());
    final namaBarang = TextEditingController();
    final jumlahBarang = TextEditingController();
    final hargaBarang = TextEditingController();
    final keterangan = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tambah Barang"),
        actions: [
          Obx(
            () => (upload.image.value == "")
                ? SizedBox()
                : IconButton(
                    onPressed: () {
                      upload.image.value = "";
                    },
                    icon: Icon(Icons.delete),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                upload.getImage(ImageSource.gallery);
              },
              child: Obx(() {
                return Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey,
                  child: (upload.image.value == "")
                      ? Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 100,
                          ),
                        )
                      : Image(
                          image: FileImage(
                            File(upload.image.value),
                          ),
                        ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: namaBarang,
                decoration: InputDecoration(
                  hintText: "Nama Barang",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: jumlahBarang,
                decoration: InputDecoration(
                  hintText: "Jumlah Barang",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: hargaBarang,
                decoration: InputDecoration(
                  hintText: "Harga Barang",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: keterangan,
                decoration: InputDecoration(
                  hintText: "Keterangan Barang",
                ),
              ),
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: (barang.loading.isTrue)
                    ? CircularProgressIndicator.adaptive()
                    : ElevatedButton(
                        onPressed: () async {
                          barang.loading.value = true;
                          if (upload.image.value == "") {
                            barang.image.value = "";
                          } else {
                            barang.image.value =
                                await StorageServices.uploadImage(
                              fileImage: File(upload.image.value),
                              tipe: "barang",
                            );
                          }
                          BarangModel model = BarangModel(
                            keterangan: keterangan.text,
                            hargaBarang: int.parse(hargaBarang.text),
                            namaBarang: namaBarang.text,
                            jumlahBarang: int.parse(jumlahBarang.text),
                            imageUrl: barang.image.value,
                          );
                          await BarangServices.addBarang(model);
                          barang.loading.value = false;
                          Get.back();
                        },
                        child: Text("Simpan"),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
