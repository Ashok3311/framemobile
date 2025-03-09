
// import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

// class SaveImagePage extends StatefulWidget {
//   @override
//   _SaveImagePageState createState() => _SaveImagePageState();
// }

// class _SaveImagePageState extends State<SaveImagePage> {
//   String imagePath = "your_image_path_here"; // Set your image path here

//   // Function to save image to gallery
//   Future<void> _saveImage() async {
//     final result = await ImageGallerySaver.saveFile(imagePath);

//     if (result['isSuccess']) {
//       print("Image saved to gallery");
//       // You can show a success message to the user
//     } else {
//       print("Failed to save image");
//       // Handle failure if needed
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Save Image to Gallery')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _saveImage,
//           child: Text('Save Image'),
//         ),
//       ),
//     );
//   }
// }
