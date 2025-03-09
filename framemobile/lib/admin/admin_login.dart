import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:framemobile/admin/add_wallpaper.dart' show AddWallpaper;



class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController Usernamecontroller = TextEditingController();
  TextEditingController Userpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 211, 200),
      body: Container(
        child: Stack(
          children: [
            // Background
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 53, 51, 51),
                    const Color.fromARGB(255, 65, 131, 231),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    110,
                  ),
                ),
              ),
            ),

            // Form
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 60,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    // Title
                    const Text(
                      "Let's start with \n Admit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Main Form Container
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),

                            // Username Field
                            Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 5,
                                top: 5,
                                right: 5,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 160, 160, 148),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: Usernamecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter username';
                                    }
                                    return null; // No error
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 148),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 50),

                            // Password Field
                            Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 5,
                                top: 5,
                                right: 5,
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 160, 160, 148),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: Userpasswordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null; // No error
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 160, 160, 148),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Login Button
                            GestureDetector(
                              onTap: () {
                                LoginAdmin();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Login",
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Fixed LoginAdmin Function
  void LoginAdmin() async {
  // Ensure the user is logged in first
  FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
    bool isValid = false;
    
    snapshot.docs.forEach((result) {
      // Check credentials for each admin
      if (result.data()['id'] == Usernamecontroller.text.trim() &&
          result.data()['password'] == Userpasswordcontroller.text.trim()) {
        isValid = true;

        // Navigate to AddWallpaper screen if credentials match
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AddWallpaper()),
        );
      }
    });

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: const Text(
            "Invalid credentials! Please check your username and password.",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }).catchError((error) {
    print("Error: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: const Text(
          "Error fetching Admin data: Permission denied or Firestore issue",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  });
}

}
