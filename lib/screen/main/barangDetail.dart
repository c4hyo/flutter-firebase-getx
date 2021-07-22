import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/barangController.dart';
import 'package:katalog/model/barangModel.dart';

class DetailBarang extends StatelessWidget {
  final BarangModel? barangModel;

  DetailBarang({required this.barangModel});

  @override
  Widget build(BuildContext context) {
    final bc = Get.put<BarangController>(BarangController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("${barangModel!.imageUrl}"),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "${barangModel!.namaBarang}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${barangModel!.hargaBarang}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Barang yang tersedia : ${barangModel!.jumlahBarang}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 30, bottom: 20, right: 20),
                child: Obx(() {
                  return Column(
                    children: [
                      Text(
                        "${barangModel!.keterangan}",
                        textAlign: TextAlign.justify,
                        maxLines: (bc.readMore.isTrue)? null:1,
                        overflow:(bc.readMore.isTrue)? TextOverflow.visible:TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bc.readMore.toggle();
                        },
                        child: Text(
                          (bc.readMore.isFalse)?"ReadMore":"Hide",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          print("exe");
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Flexible(child: SizedBox()),
                    Flexible(
                      flex: 7,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
