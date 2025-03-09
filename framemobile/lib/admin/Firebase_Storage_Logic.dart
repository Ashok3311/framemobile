import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static Future<String> uploadImage(File imageFile, String imageId) async {
    try {
      String fileName = "$imageId.jpg";
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages/$fileName");
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception("Failed to upload image: $e");
    }
  }
}
