import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katalog/model/barangModel.dart';
import 'package:katalog/screen/main/barangDetail.dart';

Widget cardBarangAll({BarangModel? model}) {
  return Container(
    height: 150,
    width: double.infinity,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Center(
                  child: (model!.imageUrl == "" || model.imageUrl == null)
                      ? FlutterLogo(
                          size: 80,
                        )
                      : Image(image: NetworkImage(model.imageUrl!),),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "${model.namaBarang}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      "${model.jumlahBarang}",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                          ),
                          onPressed: () => Get.to(
                            () => DetailBarang(
                              barangModel: model,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
