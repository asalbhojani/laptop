import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/main.dart';


class ProductsList extends StatefulWidget {

  String brandName;
  ProductsList({required this.brandName});
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  String selectedPriceFilter = "None";
  String selectedStorageFilter = "None";
  var searchName = "";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


        body:SingleChildScrollView(

          child: Column(
            children: [

              Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 170,
                      color: Color(0xf0003333),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            padding: EdgeInsets.all(7.0),
                            margin: EdgeInsets.only(left: 30,top: 40),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation()));
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded, // Arrow icon
                                size: 18, // Icon size
                                color: Colors.white, // Icon color (match the container background)
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            padding: EdgeInsets.all(7.0),
                            margin: EdgeInsets.only(left: 150,top: 35),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(40)
                            ),
                          ),

                        ],),
                    ),


                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 120,bottom: 20),
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [



                          // SizedBox(height: 20,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 35, right: 20),
                                width: 150,
                                height: 50,
                                child: DropdownButton<String>(
                                  value: selectedPriceFilter,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedPriceFilter = newValue!;
                                    });
                                  },
                                  items: <String>['None', 'Low to High', 'High to Low']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                                width: 150,
                                height: 50,
                                child: DropdownButton<String>(
                                  value: selectedStorageFilter,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedStorageFilter = newValue!;
                                    });
                                  },
                                  items: <String>['None', 'Low to High', 'High to Low']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),



                            ],),


                          // GestureDetector(
                          //   onTap: (){
                          //     Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation(),));
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.symmetric(horizontal: 10),
                          //     child: Text("Home > sofa", style: GoogleFonts.poppins(
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w600,
                          //       color: Color(0xf0626262),
                          //     ),),
                          //   ),
                          // ),




                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Product-Data")
                                  .where('Product-Brand', isEqualTo: widget.brandName)
                                  .orderBy('Product-Price',
                                  descending: selectedPriceFilter == 'High to Low')
                                  .orderBy('Product-Storage',
                                  descending: selectedStorageFilter == 'High to Low')
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
                                // Rest of the code remains unchanged

                                if(snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasData) {
                                  var dataLength = snapshot.data!.docs.length;
                                  return dataLength==0?Text("Nothing to Show"):
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: GridView.count(
                                      crossAxisCount: 2,
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 280/450,
                                      children: List.generate(dataLength, (index) {
                                        String name = snapshot.data!.docs[index]['Product-Name'];
                                        String img = snapshot.data!.docs[index]['Product-Image'];
                                        String price = snapshot.data!.docs[index]['Product-Price'];
                                        return  Stack(
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
                                                        color: Color(
                                                            0xf4a1a1a1),
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
                                                            width: 200,
                                                            height: 170,
                                                            margin: EdgeInsets.only(top: 20),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                              color: Color(0xffffffff),
                                                              image: DecorationImage(
                                                                  colorFilter: ColorFilter.mode(Color(
                                                                      0xffffffff).withOpacity(0.2), BlendMode.darken),
                                                                  fit: BoxFit.cover,
                                                                  image: NetworkImage("$img")),
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
                                                              margin: EdgeInsets.only(left: 135,right: 5,top: 5),
                                                              decoration: BoxDecoration(

                                                                  shape: BoxShape.circle,
                                                                  color: Color(0xffffffff),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color:  Color(
                                                                          0xf3c4c4c4),
                                                                      spreadRadius: 1,
                                                                      blurRadius: 5,
                                                                      offset: Offset(2, 2),
                                                                    )
                                                                  ]
                                                                // border: Border.all(color: Color(0xffa19e9e))
                                                              ),
                                                              child: Icon(CupertinoIcons.heart,color: Color(0xf0003333))
                                                          ),

                                                        ],),
                                                      // SizedBox(height: 30,),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 6,left: 10,right: 10),
                                                        child: Text("$name",style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                          color:Theme.of(context).iconTheme.color,
                                                        ),),
                                                      ),

                                                      Row(
                                                        children: [
                                                          SizedBox(width: 10,),
                                                          Icon(Icons.star_outline_rounded,color: Color(
                                                              0xf0343434)),
                                                          SizedBox(width: 5,),
                                                          Text("5.00", style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w600,
                                                            color:  Color(0xf0343434),
                                                          ),),
                                                          SizedBox(width: 18,),
                                                          Text("\$$price",style: GoogleFonts.poppins(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color(0xf0003333),
                                                          ),),
                                                        ],
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),

                                    ),
                                  );
                                }if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                }
                                return Container();
                              }),






                        ],
                      ),
                    ),

                  ]),

            ],
          ),

        ));
  }
}
