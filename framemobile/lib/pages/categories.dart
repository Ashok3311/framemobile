import 'package:flutter/material.dart';
import 'package:framemobile/full%20page/all_wallpaper.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Center(
                child: Text("Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                   fontFamily: 'Poppins',
                   fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height:15,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllWallpaper(category: 'Wildlife')));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/wilda.jpeg",
                        width: MediaQuery.of(context).size.width,
                        height: 180,fit: BoxFit.cover,),
                      ),
                      Container(
                        width: MediaQuery.of
                        (context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Center(child:
                          Text("Wildlife",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),
                 GestureDetector(
                   onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllWallpaper(category: 'Food')));
                },
                   child: Container(
                                   margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                                   width: MediaQuery.of(context).size.width,
                                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/food.jpeg",
                        width: MediaQuery.of(context).size.width,
                        height: 180,fit: BoxFit.cover,),
                      ),
                      Container(
                        width: MediaQuery.of
                        (context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Center(child:
                          Text("Food",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                            ),)
                        ),
                      )
                    ],
                                   ),
                                 ),
                 ),
                 GestureDetector(
                   onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllWallpaper(category: 'City')));
                },
                   child: Container(
                                   margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                                   width: MediaQuery.of(context).size.width,
                                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/city.jpeg",
                        width: MediaQuery.of(context).size.width,
                        height: 180,fit: BoxFit.cover,),
                      ),
                      Container(
                        width: MediaQuery.of
                        (context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Center(child:
                          Text("City",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                            ),)
                        ),
                      )
                    ],
                                   ),
                                 ),
                 ),
                 GestureDetector(
                   onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllWallpaper(category: 'Nature')));
                },
                   child: Container(
                                   margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                                   width: MediaQuery.of(context).size.width,
                                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/nature.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: 180,fit: BoxFit.cover,),
                      ),
                      Container(
                        width: MediaQuery.of
                        (context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Center(child:
                          Text("Nature",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                            ),)
                        ),
                      )
                    ],
                                   ),
                                 ),
                 ),
            ],
          ),
        ),
      ),
    );
  }
}