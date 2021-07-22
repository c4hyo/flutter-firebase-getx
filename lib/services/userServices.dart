import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:katalog/model/userModel.dart';

class UserServices{
  CollectionReference user = FirebaseFirestore.instance.collection("user");

  Future<bool> createUser({UserModel? model}) async{
    try {
      await user.doc(model!.id!).set({
        "nama": model.nama,
        "email": model.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getProfil({String? id}) async{
    try{
      DocumentSnapshot doc = await user.doc(id!).get();
      return UserModel.docSnapshot(doc);
    }catch(e){
      print(e);
      rethrow;
    }
  }
}