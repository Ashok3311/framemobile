import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';  // Import the image_gallery_saver package
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class FullScreen extends StatefulWidget {
  final String imagepath;
  const FullScreen({required this.imagepath});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  bool _isDownloading = false;

  // Function to download and save the image
  Future<void> _saveImage() async {
    setState(() {
      _isDownloading = true;
    });

    try {
      // Download the image from the URL
      var response = await http.get(Uri.parse(widget.imagepath));
      if (response.statusCode == 200) {
        // Save the image to the gallery
        final result = await ImageGallerySaverPlus.saveImage(
          response.bodyBytes,  // Image bytes
          quality: 100,  // Image quality (optional)
          name: "wallpaper_${DateTime.now().millisecondsSinceEpoch}",  // Image name (optional)
        );

        if (result['isSuccess'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Wallpaper saved to gallery!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save wallpaper.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download image.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imagepath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.imagepath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: _isDownloading ? null : _saveImage,
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white54,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [Color(0x36ffffff), Color(0x0fffffff)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _isDownloading ? "Downloading..." : "Set Wallpaper",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                'Images will be saved in the gallery',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(255, 241, 208, 208),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}