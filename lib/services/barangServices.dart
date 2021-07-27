import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:katalog/model/barangModel.dart';
import 'package:katalog/utility/text.dart';

class BarangServices{
  static CollectionReference barang = FirebaseFirestore.instance.collection("barang");

  static Future<bool> addBarang(BarangModel model) async{
    try{
      await barang.add({
        "nama_barang":model.namaBarang,
        "jumlah_barang":model.jumlahBarang,
        "harga_barang":model.hargaBarang,
        "keterangan":model.keterangan,
        "image_url":model.imageUrl,
        "search":caseSearch(model.namaBarang!.toLowerCase()),
      });
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}