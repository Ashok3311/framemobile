import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:framemobile/service/database.dart';

// ignore: must_be_immutable
class AllWallpaper extends StatefulWidget {
  String category;
  AllWallpaper({super.key, required this.category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  Stream? categoryStream;

  getonheload() async {
    categoryStream = await DatabaseMethods().getCategory(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getonheload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the button is pressed
          },
        ),
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Optional, customize the AppBar background
        elevation: 0, // Optional, to remove the shadow
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: allWallpaper()),
          ],
        ),
      ),
    );
  }

  Widget allWallpaper() {
    return StreamBuilder(
      stream: categoryStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 0.1,
                  crossAxisSpacing: 0.1,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin: EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ds['Images'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }
}
