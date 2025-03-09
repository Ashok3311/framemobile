import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:framemobile/service/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryitems = ['WildLife', 'Food', 'Nature', 'City'];
  String? value;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  uploadItem() async {
  if (_selectedImage != null) {
    try {
      String addId = randomAlphaNumeric(10); // Generate a unique ID for the image
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("wallpapers").child(addId);

      // Upload the image file to Firebase Storage
      UploadTask uploadTask = firebaseStorageRef.putFile(_selectedImage!);

      // Wait for the upload to complete and get the task snapshot
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

      if (snapshot.state == TaskState.success) {
        // Only proceed if the upload was successful
        String downloadUrl = await snapshot.ref.getDownloadURL();

        // Create a map to store wallpaper data
        Map<String, dynamic> addItem = {
          "Images": downloadUrl,
          "Id": addId,
          "Category": value,
        };

        // Add the wallpaper info to the database
        await DatabaseMethods()
            .addWallpaper(addItem, addId, value!)
            .then((value) {
          Fluttertoast.showToast(
            msg: "Wallpaper has been Added Successfully!!!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        });
      } else {
        throw Exception("Failed to upload image. Upload failed.");
      }
    } catch (e) {
      print("Error uploading image: $e");
      Fluttertoast.showToast(
        msg: "Error uploading image: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  } else {
    Fluttertoast.showToast(
      msg: "Please select an image first",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Wallpaper",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 4.0,
                child: GestureDetector(
                  onTap: _showImagePickerOptions,
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _selectedImage == null
                        ? Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 215, 215),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  items: categoryitems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;
                    });
                  },
                  hint: Text(
                    "Select a category",
                    style: TextStyle(color: const Color.fromARGB(255, 139, 144, 231), fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                uploadItem();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
