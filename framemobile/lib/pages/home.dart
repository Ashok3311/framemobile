import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> Wallpaperimage = [
  "images/wallpaper_1.jpg",
  "images/wallpaper_2.jpg",
  "images/wallpaper_3.jpg"

];

  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
        children: [
          Row(
            children: [
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(60),
                child: ClipRRect(
                borderRadius:BorderRadius.circular(60),
                child: Image.asset("images/icons/wallpapericon.png",
                height: 60,width: 60,
                fit:BoxFit.cover,)),
              ),

              SizedBox(width: 70,),
              Text("FrameFlick", style: 
              TextStyle(color:Colors.black,
              fontSize:28,fontWeight:FontWeight.
              bold,fontFamily:'Poppins',),),
            
            ],
          ),
           SizedBox(height: 30),
            CarouselSlider.builder(itemCount:Wallpaperimage.length, itemBuilder:(context,index,realIndex)
              {
                final res= Wallpaperimage[index];
                 return buildImage(res,index);
              } , 
              options: CarouselOptions(
                autoPlay: true,
                height: MediaQuery.of(context).size.height/1.5,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,onPageChanged: (index, reason){
                  setState(() {
                    activeIndex=index;
                  });
                },
              )),
                SizedBox(height: 20,),
                Center(child: buildIndicator(),),
        ],
      ))
    );
   }
    Widget buildIndicator()=> AnimatedSmoothIndicator
    (activeIndex: activeIndex, 
    count:3,
    //  effect:JumpingDotEffect(  indicator chai jump hunxa arko dot ma cha)
       effect:SlideEffect(
      dotWidth: 12,
      dotHeight: 12,
      activeDotColor: Colors.blue
    ),);
     
      Widget buildImage(String urlImage,int index)=> Container(
        margin: EdgeInsets.only(right: 0),
    height: MediaQuery.of(context).size.height/2,
    width: MediaQuery.of(context).size.width,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(urlImage,fit: BoxFit.cover,)
    ),
   );
}