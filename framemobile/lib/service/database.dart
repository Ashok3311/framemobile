import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // Add wallpaper to Firestore
  Future addWallpaper(
      Map<String, dynamic> wallpaperInfoMap, String id, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set(wallpaperInfoMap);
  }
  Future<Stream<QuerySnapshot>>getCategory(String name)async{
    return  await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
