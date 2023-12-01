// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class products extends StatefulWidget {
  const products({super.key});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {


  List img= ['assets/img/sofa.png',
    'assets/img/sofa1.png',
    'assets/img/sofa2.png',
    'assets/img/sofa3.png',
    'assets/img/sofa4.png',
    'assets/img/sofa5.png',
    'assets/img/sofa6.png',
    'assets/img/sofa7.png',
    'assets/img/sofa8.png',
  ];

  List name=['Luxury Blue ArmChair',
    'Luxury Torqoise Chair',
    'Luxury Orange Chair',
    'Royal Black Chair',
    'Luxury ArmChair',
    'Luxury Pink Chair',
    'Royal Grey Chair',
    'Luxury Grey Chair',
    'Luxury Grey Chair',
  ];

  List price=['74','61','88','96','83','69','86','88','83'];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body:SingleChildScrollView(

          child: Column(
            children: [

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 300/450,
                        children: List.generate(img.length, (index) => Stack(
                          children: [
                            // Container(
                            //    width: 30,
                            //    height: 320,
                            //    decoration: BoxDecoration(
                            //      borderRadius: BorderRadius.circular(20),
                            //      color: Color(0xff002a62),
                            //        boxShadow: [
                            //          BoxShadow(
                            //            color: Color(0xff8f8989,),
                            //            spreadRadius: 4,
                            //            blurRadius: 10,
                            //            offset: Offset(4, 4),
                            //          )
                            //        ]
                            //    ),
                            //  ),

                            GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> sofaDescription(img: img[index], price: price[index], name: name[index]),));
                              },
                              child: Container(
                                width: 350,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffffffff),
                                    // image: DecorationImage(
                                    //     colorFilter: ColorFilter.mode(Color(
                                    //         0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                    //     fit: BoxFit.cover,
                                    //     image: AssetImage("${img[index]}")),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color( 0xf44d4d4d),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(1, 1),
                                      )
                                    ]
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Stack(
                                        children: <Widget>[

                                          Container(
                                            width: 300,
                                            height: 170,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Color(0xffffffff),
                                                // image: DecorationImage(
                                                //     colorFilter: ColorFilter.mode(Color(
                                                //         0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                                //     fit: BoxFit.cover,
                                                //     image: AssetImage("${img[index]}")),
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //     color: Color( 0xf44d4d4d),
                                                //     spreadRadius: 1,
                                                //     blurRadius: 5,
                                                //     offset: Offset(1, 1),
                                                //   )
                                                // ]
                                            ),
                                          ),
                                          Container(
                                              width: 40,
                                              height: 33,
                                              margin: EdgeInsets.only(left: 125,right: 10,top: 5),
                                              decoration: BoxDecoration(

                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context).primaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:  Color(0xf343434),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset: Offset(2, 2),
                                                    )
                                                  ]
                                                // border: Border.all(color: Color(0xffa19e9e))
                                              ),
                                              child: Icon(CupertinoIcons.heart,color: Color(0xffff6d40))
                                          ),

                                        ],),
                                      // SizedBox(height: 30,),
                                      Container(
                                        margin: EdgeInsets.only(top: 30,left: 20),
                                        child: Text("${name[index]}",style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:Theme.of(context).iconTheme.color,
                                        ),),
                                      ),

                                      Row(
                                        children: [
                                          SizedBox(width: 20,),
                                          Icon(Icons.star_outline_rounded,color: Color(
                                              0xf0343434)),
                                          SizedBox(width: 5,),
                                          Text("5.00", style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color:  Color(0xf0343434),
                                          ),),
                                          SizedBox(width: 60,),
                                          Text("\$${price[index]}",style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff6d40),
                                          ),),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )),

                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),

        ));
  }
}


//
// class test extends StatefulWidget {
//   const test({super.key});
//
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   List<String> _buttons = ['HP', 'Dell', 'Lenovo', 'Alienware', 'Asus'];
//   String _selectedButton = '';
//   int selectedIndex = 0;
//
//   Future<void> _getData(String button) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
//         'Product-Data').where('brand', isEqualTo: button).get();
//     setState(() {
//       _selectedButton = querySnapshot.docs[0]['data'];
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: _buttons.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                       _getData(_buttons[index]);
//                     },
//                     child:
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                       child: ElevatedButton(
//                         onPressed: (){
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                               selectedIndex == index ? Color(0xf001174d) : Color(0xffffffff),
//                             ),
//                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(11),
//                                     side: BorderSide(color: Color(0xf969696))
//                                 ))
//                         ),
//                         child:Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.chair_alt_outlined, color: selectedIndex == index ? Color(0xffffffff) :
//                               Color(0xf0000000),),
//                               SizedBox(width: 5,),
//                               Text(_buttons[index], style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                                 color: selectedIndex == index ? Color(0xffffffff) :
//                                 Color(0xf0000000),
//                               ),)
//                             ],),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 _selectedButton,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }
//
// class CarouselSliderExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CarouselSlider(
//         items: [
//
// //First Slider
//
//           Container(
//             width: 700,
//             // margin: EdgeInsets.symmetric(horizontal: 20),
//             // color: Colors.orange,
//             height: 240,
//             child:
//
//             Row(
//                 children: [
//                   Stack(
//                     children:[
//
//                       Container(
//                         margin: EdgeInsets.only(left:120,bottom: 50),
//                         // padding: EdgeInsets.only(left: 10),
//                         width: 200,
//                         height: 300,
//                         // color: Colors.cyan,
//                         child: Image.asset("assets/images/carousel3.png"),
//                       ),
//
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 170,
//                             height: 30,
//                             // color: Colors.cyan,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name', style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xf0a9a9a9),
//                             ),),
//                           ),
//                           Container(
//                             width: 170,
//                             height: 80,
//                             // color: Colors.lightBlue,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xf0171717),
//                             ),),
//                           ),
//
//                           GestureDetector(
//                             onTap: (){},
//                             child: Container(
//                               padding: EdgeInsets.only(left: 18,top: 7),
//                               width: 100,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   color: Color(0xf0003333),
//                                   borderRadius: BorderRadius.circular( 20)
//                               ),
//                               child: Text("Buy Now",style: GoogleFonts.poppins(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xf0ffffff),
//                               ),),
//                             ),
//                           )
//
//                         ],),
//
//
//
//                     ],),
//                 ]),
//           ),
//
//
// //second slider
//
//           Container(
//             width: 700,
//             // margin: EdgeInsets.symmetric(horizontal: 20),
//             // color: Colors.orange,
//             height: 240,
//             child:
//
//             Row(
//                 children: [
//                   Stack(
//                     children:[
//
//                       Container(
//                         margin: EdgeInsets.only(left:120,bottom: 50),
//                         // padding: EdgeInsets.only(left: 10),
//                         width: 200,
//                         height: 350,
//                         // color: Colors.cyan,
//                         child: Image.asset("assets/images/carousel1.png"),
//                       ),
//
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 170,
//                             height: 30,
//                             // color: Colors.cyan,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name', style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xf0a9a9a9),
//                             ),),
//                           ),
//                           Container(
//                             width: 170,
//                             height: 80,
//                             // color: Colors.lightBlue,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xf0171717),
//                             ),),
//                           ),
//
//                           GestureDetector(
//                             onTap: (){},
//                             child: Container(
//                               padding: EdgeInsets.only(left: 18,top: 7),
//                               width: 100,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   color: Color(0xf0003333),
//                                   borderRadius: BorderRadius.circular( 20)
//                               ),
//                               child: Text("Buy Now",style: GoogleFonts.poppins(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xf0ffffff),
//                               ),),
//                             ),
//                           )
//
//                         ],),
//
//
//
//                     ],),
//                 ]),
//           ),
//
// //Third Slider
//
//           Container(
//             width: 700,
//             // margin: EdgeInsets.symmetric(horizontal: 20),
//             // color: Colors.orange,
//             height: 240,
//             child:
//
//             Row(
//                 children: [
//                   Stack(
//                     children:[
//
//                       Container(
//                         margin: EdgeInsets.only(left:120,bottom: 50),
//                         // padding: EdgeInsets.only(left: 10),
//                         width: 200,
//                         height: 350,
//                         // color: Colors.cyan,
//                         child: Image.asset("assets/images/carousel7.jpg"),
//                       ),
//
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 170,
//                             height: 30,
//                             // color: Colors.cyan,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name', style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xf0a9a9a9),
//                             ),),
//                           ),
//                           Container(
//                             width: 170,
//                             height: 80,
//                             // color: Colors.lightBlue,
//                             // margin: EdgeInsets.symmetric(horizontal: 15),
//                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xf0171717),
//                             ),
//                               // softWrap: true,
//                             ),
//                           ),
//
//                           GestureDetector(
//                             onTap: (){},
//                             child: Container(
//                               padding: EdgeInsets.only(left: 18,top: 7),
//                               width: 100,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   color: Color(0xf0003333),
//                                   borderRadius: BorderRadius.circular( 20)
//                               ),
//                               child: Text("Buy Now",style: GoogleFonts.poppins(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xf0ffffff),
//                               ),),
//                             ),
//                           )
//
//                         ],),
//
//
//
//                     ],),
//                 ]),
//           ),
//
//
//
//           // Container(
//           //   margin: EdgeInsets.all(8.0),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(10.0),
//           //     image: DecorationImage(
//           //       image: NetworkImage("https://img.freepik.com/free-photo/digital-painting-mountain-with-colorful-tree-foreground_1340-25699.jpg"),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//           // Container(
//           //   margin: EdgeInsets.all(8.0),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(10.0),
//           //     image: DecorationImage(
//           //       image: NetworkImage("https://img.freepik.com/free-photo/natures-beauty-reflected-tranquil-mountain-waters-generative-ai_188544-7867.jpg"),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//           // Container(
//           //   margin: EdgeInsets.all(8.0),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(10.0),
//           //     image: DecorationImage(
//           //       image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJaGJkBMUC8PLCCOZ0prsrw8G24kIgtlgENosvHw3PJcltgjhtypEzkC0xzQuqGClM28I&usqp=CAU"),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//         ],
//         options: CarouselOptions(
//           height: 240,
//           enlargeCenterPage: true,
//           autoPlay: true,
//           aspectRatio: 16 / 9,
//           autoPlayCurve: Curves.fastOutSlowIn,
//           enableInfiniteScroll: true,
//           autoPlayAnimationDuration: Duration(milliseconds: 800),
//           viewportFraction: 0.8,
//         ),
//       ),
//     );
//   }
// }