import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/Home.dart';
import 'package:laptop/Insert.dart';
import 'package:laptop/inserted.dart';
import 'package:laptop/test.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CarouselSliderExample(),
    );
  }
}


class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            CarouselSlider(
              items: [


//First Slider

                Container(
                  width: 700,
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.orange,
                  height: 240,
                  child:

                      Row(
                      children: [
                        Stack(
                          children:[

                            Container(
                              margin: EdgeInsets.only(left:120,bottom: 50),
                              // padding: EdgeInsets.only(left: 10),
                              width: 200,
                              height: 300,
                              // color: Colors.cyan,
                              child: Image.asset("assets/images/DELL/1stlaptop.jpg"),
                            ),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              height: 30,
                              // color: Colors.cyan,
                              // margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('laptop name', style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xf0a9a9a9),
                              ),),
                            ),
                            Container(
                              width: 170,
                              height: 80,
                              // color: Colors.lightBlue,
                              // margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xf0171717),
                              ),),
                            ),

                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.only(left: 18,top: 7),
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xf0003333),
                                  borderRadius: BorderRadius.circular( 20)
                                ),
                                child: Text("Buy Now",style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xf0ffffff),
                                ),),
                              ),
                            )

                          ],),



                      ],),
                  ]),
                ),


//second slider

                Container(
                  width: 700,
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.orange,
                  height: 240,
                  child:

                  Row(
                      children: [
                        Stack(
                          children:[

                            Container(
                              margin: EdgeInsets.only(left:120,bottom: 50),
                              // padding: EdgeInsets.only(left: 10),
                              width: 200,
                              height: 350,
                              // color: Colors.cyan,
                              child: Image.asset("assets/images/lenovo/slim.png"),
                            ),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  height: 30,
                                  // color: Colors.cyan,
                                  // margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('laptop name', style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xf0a9a9a9),
                                  ),),
                                ),
                                Container(
                                  width: 170,
                                  height: 80,
                                  // color: Colors.lightBlue,
                                  // margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xf0171717),
                                  ),),
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: EdgeInsets.only(left: 18,top: 7),
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xf0003333),
                                        borderRadius: BorderRadius.circular( 20)
                                    ),
                                    child: Text("Buy Now",style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xf0ffffff),
                                    ),),
                                  ),
                                )

                              ],),



                          ],),
                      ]),
                ),

//Third Slider

                Container(
                  width: 700,
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.orange,
                  height: 240,
                  child:

                  Row(
                      children: [
                        Stack(
                          children:[

                            Container(
                              margin: EdgeInsets.only(left:120,bottom: 50),
                              // padding: EdgeInsets.only(left: 10),
                              width: 200,
                              height: 350,
                              // color: Colors.cyan,
                              child: Image.asset("assets/images/lenovo/ideapad.jpg"),
                            ),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  height: 30,
                                  // color: Colors.cyan,
                                  // margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('laptop name', style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xf0a9a9a9),
                                  ),),
                                ),
                                Container(
                                  width: 170,
                                  height: 80,
                                  // color: Colors.lightBlue,
                                  // margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xf0171717),
                                  ),
                                    // softWrap: true,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    padding: EdgeInsets.only(left: 18,top: 7),
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xf0003333),
                                        borderRadius: BorderRadius.circular( 20)
                                    ),
                                    child: Text("Buy Now",style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xf0ffffff),
                                    ),),
                                  ),
                                )

                              ],),



                          ],),
                      ]),
                ),



                // Container(
                //   margin: EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     image: DecorationImage(
                //       image: NetworkImage("https://img.freepik.com/free-photo/digital-painting-mountain-with-colorful-tree-foreground_1340-25699.jpg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     image: DecorationImage(
                //       image: NetworkImage("https://img.freepik.com/free-photo/natures-beauty-reflected-tranquil-mountain-waters-generative-ai_188544-7867.jpg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.0),
                //     image: DecorationImage(
                //       image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJaGJkBMUC8PLCCOZ0prsrw8G24kIgtlgENosvHw3PJcltgjhtypEzkC0xzQuqGClM28I&usqp=CAU"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ],
              options: CarouselOptions(
                height: 240,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ]),
    );
  }
}