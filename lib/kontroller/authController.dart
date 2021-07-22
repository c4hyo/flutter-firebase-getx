import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:katalog/kontroller/userController.dart';
import 'package:katalog/services/authServices.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  Rx<bool> loading = false.obs;
  setLoading(bool value) => loading.value = value;
  
  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void registrasi({String? nama,String? email,String? password}){
    return AuthServices().register(nama: nama,email: email,password: password);
  }
  void login({String? email,String? password}) async{
    return AuthServices().login(password: password!,email: email!);
  }

  void logOut() async{
    await _auth.signOut();
    Get.find<UserController>().clear();
  }
  
}

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);
  }
}