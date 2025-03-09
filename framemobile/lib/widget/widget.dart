import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:framemobile/full%20page/full_screen.dart';
import 'package:framemobile/models/photo_model.dart';
// Import your PhotosModel

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GridView.count(
      padding: EdgeInsets.all(4),
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 0.6,
      children: listPhotos.map((PhotosModel photosModel) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreen(
                    imagepath: photosModel.src!.portrait!,
                  ),
                ),
              );
            },
            child: Hero(
              tag: photosModel.src!.portrait!, // Ensure the tag matches
              child: CachedNetworkImage(
                imageUrl: photosModel.src!.portrait!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}