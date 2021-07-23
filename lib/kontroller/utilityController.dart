import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UtilityController extends GetxController {

  var image = "".obs;
  var search = "".obs;

  void getImage(ImageSource source) async{
    var img = await ImagePicker().pickImage(source: source);
    if(img != null){
      image.value = img.path;
    }
  }

  void resetImage(){
    image.value = "";
  }
}