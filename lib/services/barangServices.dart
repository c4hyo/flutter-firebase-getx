import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:katalog/model/barangModel.dart';

class BarangServices{
  CollectionReference _barang = FirebaseFirestore.instance.collection("barang");

  Stream<List<BarangModel>> okeS(){
    return _barang.snapshots().map((event){
      List<BarangModel> barang = [];
      event.docs.forEach((element) {
        barang.add(BarangModel.docSnapshot(element));
      });
      return barang;
    });
  }
}