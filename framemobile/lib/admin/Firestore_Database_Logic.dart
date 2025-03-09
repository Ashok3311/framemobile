// import'package:cloud_firestore/cloud_firestore.dart';
 
// class DatabaseMethods {
//   Future<void> addWallpaper(Map<String, dynamic> wallpaperData, String id, String category) async {
//     try {
//       await FirebaseFirestore.instance.collection(category).doc(id).set(wallpaperData);
//     } catch (e) {
//       throw Exception("Failed to add wallpaper: $e");
//     }
//   }

//   Stream<QuerySnapshot<Object?>>? getCategory(String category) {}
// }