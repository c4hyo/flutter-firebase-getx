import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/userController.dart';
import 'package:katalog/model/userModel.dart';
import 'package:katalog/services/userServices.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  void register({String? email, String? password, String? nama}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      UserModel model =
          UserModel(id: userCredential.user!.uid, email: email, nama: nama);
      if (await UserServices().createUser(model: model)) {
        Get.find<UserController>().user = model;
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login({String? email, String? password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      Get.find<UserController>().user =
          await UserServices().getProfil(id: userCredential.user!.uid);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
