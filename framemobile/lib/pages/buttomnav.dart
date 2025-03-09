import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:framemobile/pages/categories.dart';
import 'package:framemobile/pages/home.dart';
import 'package:framemobile/pages/search.dart';



class Buttomnav extends StatefulWidget {
  const Buttomnav({super.key});

  @override
  State<Buttomnav> createState() => _ButtomnavState();
}

class _ButtomnavState extends State<Buttomnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Home home;
  late Categories categories;
  late Search search;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    home = Home();
    categories = Categories();
    search = Search(); // Initialize search
    pages = [home, search, categories];
    currentPage = home; // Set the initial current page
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        height: 65,
        color: const Color.fromARGB(255, 84, 89, 93),
        animationDuration: Duration(
          milliseconds: 500
        ),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white
        ),
        Icon(Icons.search_outlined,  color: Colors.white),
        Icon(Icons.category,  color: Colors.white)
      ]),
      body: pages[currentTabIndex],
    );
  }
}