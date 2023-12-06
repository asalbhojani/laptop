import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  TextEditingController review = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
                  Container(
                    width: double.infinity,
                      height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/slim.png'),
                      )
                    ),
                  ),
            Stack(
              children:[ Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  color: Color.fromRGBO(6, 27, 28,1)
                ),
              ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 70,
                      margin: EdgeInsets.only(left: 30 ,top: 30),
                      child: Text("Laptop Name", style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ), ),
                    ),
                    SizedBox(width: 40,),

                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(6, 27, 28, 1),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.white, size: 40,),
                          Container(
                            decoration: BoxDecoration(
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30 ,top: 80),
                      width: 300,
                      height: 70,
                      child: Text("Price: 55,0000 PKR" , style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ), ),
                    )
                  ],
                ),

              GestureDetector(
                onTap: ()async{
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext dialogContext){
                        return AlertDialog(
                          title: Text("Ratings and Reviews"),
                          content: Container(
                            height: 200,
                            child: Column(
                              children: [

                                Container(
                                    margin: EdgeInsets.only(top: 10,bottom: 20,left: 10,right: 10),
                                    child:TextFormField(
                                        controller: review,
                                        decoration: InputDecoration(
                                          label: Text("Enter your Review"),
                                          // filled: true,
                                          // fillColor: Color(0xffff6d40),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            borderSide: BorderSide(color: Color(0xf0003333)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                            borderSide: BorderSide(color: Color(0xf0003333)),
                                          ),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.only(left: 15.0,right: 10),
                                            child: Icon(Icons.rate_review_outlined,color: Color(0xf0003333),),),
                                          // prefixIcon: Icon(Icons.person,color: Color(0xf001074f),),
                                        )
                                    )
                                ),

                                Center(
                                  child: RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    unratedColor: Colors.grey,
                                    itemCount: 5,
                                    itemSize: 30.0,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                    updateOnDrag: true,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (ratingvalue) {
                                      setState(() {
                                        rating = ratingvalue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: (){
                                  setState(() {
                                    rating=0;
                                  });
                                  Navigator.of(dialogContext).pop();
                                },  child:Text("Not Now")
                            ),
                            ElevatedButton(
                                child:Text("OK"),
                                onPressed: ()async{

                                  String productId = Uuid().v1();

                                  Map<String , dynamic> productDetails ={
                                    "Review-Id":productId,
                                    "Review-message":review.text.toString(),
                                    "Star-Rating":rating
                                  };
                                  await FirebaseFirestore.instance.collection("Product-Reviews").doc(productId).set(productDetails);
                                  Navigator.of(dialogContext).pop();
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xf0003333),
                                )),
                          ],
                        );
                      });
                },

                child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 30,
                        margin: EdgeInsets.only(top: 200),
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: rating,
                          ignoreGestures: true,
                          unratedColor: Colors.grey,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          updateOnDrag: true,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (ratingvalue) {},
                        ),
                      ),

                      SizedBox(width: 130,),

                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(6, 27, 28, 1),
                        child: Row(
                          children: [
                            Icon(Icons.reviews, color: Colors.white, size: 30,),
                            Container(
                              decoration: BoxDecoration(
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 170 , left: 20),
                      child: Text("------------------------------------" ,style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220 , left: 20),
                      child: Text("Specification: ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 280 , left: 20),
                      child: Text("01: Operating System: Window 10 Pro ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 300 , left: 20),
                      child: Text("02: Memory: 8GB Ram LPDDR5 on board ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 320 , left: 20),
                      child: Text("03: Storage: 512GB  ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 340 , left: 20),
                      child: Text("04: processor: IntelA@ Coreac i9-12900H processor 2.5 GHZ ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 360, left: 20),
                      child: Text("05: Display: 16.0 inch 4k oled 16:10 aspect ratio ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 380, left: 20),
                      child: Text("06: Power: 6.0, 200w, AC Adapter, output: 20v DC, 10A ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 400 , left: 20),
                      child: Text("07: battery: 96WHrs, 3S2P, 6 CELL ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 440 , left: 70),
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.only(left: 40, top: 8),
                        child: Text("Add To Card" ,style: GoogleFonts.poppins(
                          color: Color.fromRGBO(6, 27, 28, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    )
                  ],
                )
        ]
            ),
          ],
        ),

      ),

    );
  }
}
