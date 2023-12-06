import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/main.dart';


class favouriteList extends StatefulWidget {

  @override
  State<favouriteList> createState() => _favouriteListState();
}

class _favouriteListState extends State<favouriteList> {
  bool isFavourite =false;
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


                          StreamBuilder(
                              stream: FirebaseFirestore.instance.collection("Favourites").snapshots(),
                              builder: (BuildContext context, snapshot) {

                                if(snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasData) {
                                  var dataLength = snapshot.data!.docs.length;
                                  return dataLength==0?Text("Nothing to Show"):
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: GridView.count(
                                      crossAxisCount: 1,
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 400/200,
                                      children: List.generate(dataLength, (index) {

                                        String name = snapshot.data!.docs[index]['FavProd-Name'];
                                        String brand = snapshot.data!.docs[index]['FavProd-Brand'];
                                        String img = snapshot.data!.docs[index]['FavProd-Image'];
                                        String price = snapshot.data!.docs[index]['FavProd-Price'];

                                      return  Container(
                                          width:double.infinity,
                                          // color: Colors.lightBlueAccent,
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children:[
                                                Container(
                                                  width: 340,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Color(0xffffffff),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0xf39a9a9a),
                                                          spreadRadius: 1,
                                                          blurRadius: 5,
                                                          offset: Offset(1, 1),
                                                        )
                                                      ]
                                                  ),
                                                  child: Stack(
                                                    children: <Widget>[

                                                      Container(
                                                        width: 160,
                                                        height: 150,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15) ),
                                                          color: Theme.of(context).primaryColor,
                                                          image: DecorationImage(
                                                              colorFilter: ColorFilter.mode(Color(0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(img)
                                                          ),
                                                        ),
                                                      ),

                                                      Container(
                                                        width: 35,
                                                        height: 30,
                                                        margin: EdgeInsets.only(left: 300,right: 10,top: 5),
                                                        padding:EdgeInsets.only(top:3),
                                                        decoration: BoxDecoration(

                                                            shape: BoxShape.circle,
                                                            color: Color(0xffffffff),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(0xf39a9a9a),
                                                                spreadRadius: 3,
                                                                blurRadius: 8,
                                                                offset: Offset(1, 0),
                                                              )
                                                            ]
                                                          // border: Border.all(color: Color(0xffa19e9e))
                                                        ),
                                                        child: isFavourite? Icon(CupertinoIcons.heart_fill,color: Color(0xf0003333)):
                                                        Icon(CupertinoIcons.heart,color: Color(0xf0003333)
                                                        ),
                                                      ),
                                                      Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children:[
                                                            Container(
                                                              margin: EdgeInsets.only(left: 175,right: 5,),
                                                              child: Text('$name',style: GoogleFonts.poppins(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                color:Theme.of(context).iconTheme.color,
                                                              ),),
                                                            ),

                                                            Container(
                                                              margin: EdgeInsets.only(left: 90,right: 10,),
                                                              child: Text('\$$price',style: GoogleFonts.poppins(
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w600,
                                                                color: Color(0xf0003333),
                                                              ),),
                                                            ),

                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(left: 175,right: 10,),
                                                                  // child: Icon(Icons.star_outline_rounded,color: Color(
                                                                  //     0xf0343434)),
                                                                ),
                                                                // SizedBox(width: 5,),
                                                                Text("$brand", style: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 14,
                                                                  color:  Color(0xf0343434),
                                                                ),),
                                                                SizedBox(width: 30,),

                                                              ],),

                                                          ]),
                                                    ],),
                                                ),
                                              ]),
                                        );
                                      }

                                      ),

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
