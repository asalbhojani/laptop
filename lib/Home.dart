import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/AlienWare.dart';
import 'package:laptop/Asus.dart';
import 'package:laptop/Dell.dart';
import 'package:laptop/HP.dart';
import 'package:laptop/Lenovo.dart';
import 'package:laptop/Search.dart';
import 'package:laptop/home/ProductsList.dart';
import 'package:laptop/rating.dart';
import 'package:laptop/test.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _buttons = ['assets/images/logo_hp.jpg', 'assets/images/logo_alien.png',
    'assets/images/logo_asus.png', 'assets/images/logo_lenovo.png', 'assets/images/logo_dell.jpg'];
  String _selectedButton = '';
  int currentIndex =0;
  int selectedIndex = 0;

  List<String> _buttonsName = ['HP', 'ALIEN WARE', 'ASUS', 'LENOVO', 'DELL'];
  String _selectedButtonName = 'HP';

    List<Map<String, dynamic>> Data = [
    {'name': 'Luxury ArmChair', 'price': '48', 'img': 'assets/img/chairOrange.png'},
    {'name': 'Luxury Sofa',     'price': '60', 'img': 'assets/img/sofa.png'},
    {'name': 'Luxury Table',    'price': '30', 'img': 'assets/img/table6.png'},
  ];

  TextEditingController userSearch = TextEditingController();
  var searchName = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        backgroundColor: Color(0xffffffff),
        flexibleSpace: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));
          },
          child: Container(
              margin: EdgeInsets.only(left: 300,top: 15,right: 30),
              child: Icon(Icons.search,color: Color(0xf0000000),)),
        ),

        // dehaze

        // actions: [
        // Container(
        //   width: 200,
        //   decoration: BoxDecoration(
        //       // border: Border.all(width: 2, color: selectedIndex == index ?Color(0xf0008080):
        //       // Color(0xffffffff),),
        //   ),
        //   child: TextFormField(
        //     controller: userSearch,
        //     decoration: InputDecoration(
        //         hintText: "Search"
        //     ),
        //   ),
        // ),
        // IconButton(onPressed: (){
        //   setState(() {
        //     searchValue = userSearch.text.toString();
        //     print(searchValue);
        //   });
        // }, icon: Icon(Icons.search,color: Color(0xf0000000),)),

        // SizedBox(height: 20,),

        // ],

        centerTitle: true,
        elevation: 0,
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.dehaze,color: Color(0xf0000000),));
        }),
          // dehaze
      ),

      drawer: Drawer(

        child: Column(

          children: [

            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Color(0xf0003333),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Color(0xf0003333),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=600"))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 170,),
                    child: Center(
                      child: Text("User Name",style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xf0000000)
                      ),),
                    )
                )
              ],
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> materialApp(),));
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> fetchData(),));
              },
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
              ),
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Register(),));
              },
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Shopping Cart"),
              ),
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
              },
              child: ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Favourites"),
              ),
            ),

            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),

          ],

        ),

      ),

      body: SingleChildScrollView(

        child: SafeArea(

          child: Column(
            children: [


              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingandReview()));
                      },
                      child: Text("Rating and Review"),
                    ),

                    SizedBox(height: 30,),
                    CarouselSlider(
                      items: [
//First Slider
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          // color: Colors.orange,
                          height: double.infinity,
                          child:
                          Stack(
                            children:[

                              Container(
                                margin: EdgeInsets.only(left:120,),
                                // padding: EdgeInsets.only(left: 10),
                                width: 230,
                                height: double.infinity,
                                // color: Colors.cyan,
                                child: Image.asset("assets/images/carousel3.png"),
                              ),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170,
                                    height: 20,
                                    // color: Colors.cyan,
                                    // margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('Lenovo ThinkBook', style: GoogleFonts.poppins(
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
                                    onTap: (){

                                    },
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
                        ),
//second slider
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          // color: Colors.orange,
                          height: double.infinity,
                          child:

                          Stack(
                            children:[

                              Container(
                                margin: EdgeInsets.only(left:120,),
                                // padding: EdgeInsets.only(left: 10),
                                width: 230,
                                height: double.infinity,
                                // color: Colors.cyan,
                                child: Image.asset("assets/images/carousel1.png"),
                              ),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170,
                                    height: 20,
                                    // color: Colors.cyan,
                                    // margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('Lenovo Yoga', style: GoogleFonts.poppins(
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
                                    onTap: (){

                                    },
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
                        ),
//Third Slider
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          // color: Colors.orange,
                          height: double.infinity,
                          child:

                          Stack(
                            children:[

                              Container(
                                margin: EdgeInsets.only(left:120,),
                                // padding: EdgeInsets.only(left: 10),
                                width: 230,
                                height: double.infinity,
                                // color: Colors.cyan,
                                child: Image.asset("assets/images/carousel8.jpg"),
                              ),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170,
                                    height: 20,
                                    // color: Colors.cyan,
                                    // margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('Pro Art Studio book', style: GoogleFonts.poppins(
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
                                    onTap: (){

                                    },
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
                        ),

                      ],
                      options: CarouselOptions(
                        viewportFraction:2,
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                      ),
                    ),

                    // Container(
                    //   width: double.infinity,
                    //   height: 65,
                    //   // color: Colors.cyan,
                    //   margin: EdgeInsets.symmetric(vertical: 10),
                    //   child: Row(
                    //     children:[
                    //
                    //    SizedBox(width: 130,),
                    //           Container(
                    //             width: 51,
                    //             height: 53,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xffff6d40),
                    //               borderRadius: BorderRadius.circular(25)
                    //             ),
                    //               child: Icon(Icons.search_rounded,color:Theme.of(context).primaryColor)
                    //           ),
                    //
                    //  ], ),),

                    Container(
                      margin: EdgeInsets.only(top: 18,left: 10),
                      child: Text("Brands", style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xf0000000),
                      ),),
                    ),

//Buttons
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _buttons.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                              // border: Border.all(width: 2, color: selectedIndex == index ?Color(0xf0008080):
                              //   Color(0xffffffff),),
                              borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: selectedIndex == index ?Color(0xf0b0fafa):
                                    Color(0xffffffff),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(2, 3),
                                  )
                                ]
                            ),
                            child: ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  selectedIndex = index;
                                  _selectedButton=_buttons[index];
                                  _selectedButtonName=_buttonsName[index];
                                });
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xffffffff),),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11),
                                          side: BorderSide(color: selectedIndex == index ?
                                          Color(0xf0003333) :
                                          Color(0xffffffff),)
                                      ))
                              ),
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2, ),
                               child:
                                    Container(
                                      width: 80,
                                      height: 180,
                                      // color: Colors.cyan,
                                      child: Image.asset(_buttons[index]),
                                    )
                                    // Text(_buttons[index], style: GoogleFonts.poppins(
                                    //   fontWeight: FontWeight.w500,
                                    //   color: selectedIndex == index ? Color(0xffffffff) :
                                    //   Color(0xf0000000),
                                    // ),)
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                    // SizedBox(height: 18,),
                    Text("Popular", style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xf0000000),
                    ),),



                    StreamBuilder(
                        stream: FirebaseFirestore.instance.collection("Product-Data").where('Product-Brand',isEqualTo: _selectedButtonName)
                            .snapshots(),
                        builder: (BuildContext context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            var dataLength = snapshot.data!.docs.length;
                            return dataLength==0?Text("Nothing to Show"):
                            ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                String name = snapshot.data!.docs[index]['Product-Name'];
                                String img = snapshot.data!.docs[index]['Product-Image'];
                                return
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 300,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(
                                                    0xf4a1a1a1),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              )
                                            ],
                                          color: Color(0xf0e37e51),
                                          //0xf0ceacc5,0xf0e1ccd8
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      Container(
                                        width: 330,
                                        height: 300,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xf0f55c27),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      Container(
                                        width: 310,
                                        height: 300,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xf0b64415),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      Container(
                                        width: 290,
                                        height: 300,
                                        margin: EdgeInsets.symmetric(vertical: 10,),
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          //0xf056b0c4,  0xf0e1a1c8,0xf0ffcce4,0xf0eecadb,0xf0ffd9ea,0xf0fad5e1
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [

                                            Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(top: 30),
                                                  width: double.infinity,
                                                  height: 200,
                                                  color: Color(0xffffff),
                                                  alignment: Alignment.center,
                                                  child: Image.network(img,
                                                      width: double.infinity,
                                                      height: 300,
                                                      fit: BoxFit.cover),
                                                ),
                                                Container(
                                                    width: 40,
                                                    height: 33,
                                                    margin: EdgeInsets.only(left: 230,top: 5,right: 20),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xffffffff),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(0xffababab,),
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset: Offset(2, 2),
                                                          )
                                                        ]
                                                      // border: Border.all(color: Color(0xffa19e9e))
                                                    ),
                                                    child: Icon(CupertinoIcons.heart,color: Color(0xf0003333))
                                                ),

                                              ],
                                            ),


                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 15),
                                              child: Text(name, style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xf0363535),
                                              ),),
                                            ),

                                            Container(
                                              width: double.infinity,
                                              height: 35,
                                              // color: Colors.lightBlueAccent,
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                                    child: Text("\$${Data[currentIndex]['price']}", style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color(0xf00c0c0c),
                                                    ),),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],);
                              },);
                          }if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          }
                          return Container();
                        }),



//Show more
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      width: 150,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        setState(() {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> filterList(brandName: _selectedButtonName),));
                          // updateData("Luxury Table", 48,"assets/img/table.png");

                          // updateData("Luxury Table", 48,"assets/img/table.png");
                        });
                      },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xf0003333)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    side: BorderSide(color: Color(0xf0003333))
                                ))
                        ),
                        child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
                          child: Row(
                            children: [
                              Icon(Icons.expand_more, color:  Color(0xffffffff)),
                              SizedBox(width: 5,),
                              Text("Show More", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color:  Color(0xffffffff),
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),



                    // Row(
                    //   children:[
                    //     SizedBox(width: 20,),
                    //     Text("Discover Our",style: GoogleFonts.workSans(
                    //     fontSize: 27,
                    //     fontWeight: FontWeight.w500,
                    //     color: Color(0xf0000000),
                    //   ),),
                    //     SizedBox(width: 140,),
                    //     Container(
                    //       width: 51,
                    //       height: 53,
                    //       decoration: BoxDecoration(
                    //         color: Color(0xffff6d40),
                    //         borderRadius: BorderRadius.circular(23)
                    //       ),
                    //         child: Icon(Icons.search,color: Color(0xffffffff))
                    //     ),
                    //
                    //   ],),

                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Text("Products",style: GoogleFonts.workSans(
                    //     fontSize: 27,
                    //     fontWeight: FontWeight.w700,
                    //     color: Color(0xf0000000),
                    //   ),),
                    // ),



                  ],
                ),
              ),
            ],
          ),
        ),

      ),



    );
  }
}
