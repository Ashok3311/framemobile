import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:framemobile/pages/buttomnav.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart'; // Import the generated fil

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use platform-specific options
  );
  await Permission.storage.request(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Buttomnav(),
      ),
    );
  }
}
