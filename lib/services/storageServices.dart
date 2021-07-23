import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as store;
import 'package:uuid/uuid.dart';

class ImageConfig {
  static compressImage(String imageId, File image) async {
    final tempDir = await getTemporaryDirectory();
    final paths = tempDir.path;
    File? compress = await FlutterImageCompress.compressAndGetFile(
      image.absolute.path,
      "$paths/img_$imageId.jpg",
      quality: 70,
    );
    return compress;
  }
}

class StorageServices {
  static store.Reference storage = store.FirebaseStorage.instance.ref();

  static Future<String> uploadImage({File? fileImage, String? tipe}) async {
    String imageId = Uuid().v4();
    File image = await ImageConfig.compressImage(imageId, fileImage!);
    store.UploadTask uploadTask =
        storage.child("image/$tipe/photo-$imageId.jpg").putFile(image);
    store.TaskSnapshot snaps = await uploadTask.whenComplete(() => null);
    String imageUrl = await snaps.ref.getDownloadURL();
    return imageUrl;
  }

  static Future<void> deleteImage(String imageUrl) async {
    store.Reference storage =
        store.FirebaseStorage.instance.refFromURL(imageUrl);
    return await storage.delete();
  }
}
