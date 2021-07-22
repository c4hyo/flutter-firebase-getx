import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  String? email;
  String? nama;

  UserModel({this.id,this.email,this.nama});

  UserModel.docSnapshot(DocumentSnapshot snapshot){
    id = snapshot.id;
    email = snapshot['email'];
    nama = snapshot['nama'];

  }
}