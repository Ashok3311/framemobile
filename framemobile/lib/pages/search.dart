import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:framemobile/models/photo_model.dart';
import 'package:framemobile/widget/widget.dart';

import 'package:http/http.dart' as http;


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchController = TextEditingController();
  bool search =false;
  Future<void> getSearchWallpaper(String searchQuery) async {
    await http
        .get(
          Uri.parse(
              "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"), // Fixed URL by removing extra space
          headers: {
            "Authorization": "UJiLOM8mFMCwB596XKH5p41WrPia7hebv05yCUTIIGNlb539R9HqaB8D"
          },
        )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        search = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFececF8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      getSearchWallpaper(searchController.text);
                    },
                    child: search? GestureDetector(
                      onTap: (){
                        photos =[];
                        search=false;
                        setState(() {
                          
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 84, 89, 93),
                      ),
                    ):Icon(
                      Icons.search_outlined,
                      color: Color.fromARGB(255, 84, 89, 93),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
           Expanded(child: wallpaper(photos, context))
          ],
        ),
      ),
    );
  }
}
