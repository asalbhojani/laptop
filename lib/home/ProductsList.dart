import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/home/Description_Screen.dart';
import 'package:laptop/main.dart';
import 'package:uuid/uuid.dart';


class ProductsList extends StatefulWidget {

  String brandName;
  ProductsList({required this.brandName});
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  bool isProductInWishlist = false;

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
                                margin: EdgeInsets.only(top: 20,left: 75,right: 20),
                                width: 105,
                                height: 50,
                                child: ElevatedButton(onPressed: (){
                                  setState(() {

                                  });
                                },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
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
                                        Text("Filter", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color:  Color(0xf0000000),
                                        ),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.expand_more, color:  Color(0xf0000000)),

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                                width: 100,
                                height: 50,
                                child: ElevatedButton(onPressed: (){
                                  setState(() {

                                  });
                                },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
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

                                        Text("Sort", style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:  Color(0xf0000000),
                                        ),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.expand_more, color:  Color(0xf0000000)),

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],),




                          StreamBuilder(
                              stream: FirebaseFirestore.instance.collection("Product-Data").where('Product-Brand',isEqualTo: widget.brandName)
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
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
                                        String Id = snapshot.data!.docs[index]['Product-Id'];
                                        String Name = snapshot.data!.docs[index]['Product-Name'];
                                        String Brand = snapshot.data!.docs[index]['Product-Brand'];
                                        String Img = snapshot.data!.docs[index]['Product-Image'];
                                        double Price = snapshot.data!.docs[index]['Product-Price'];
                                        String Battery = snapshot.data!.docs[index]['Product-Battery'];
                                        String Display = snapshot.data!.docs[index]['Product-Display'];
                                        String Memory = snapshot.data!.docs[index]['Product-Memory'];
                                        String Processor = snapshot.data!.docs[index]['Product-Processor'];
                                        String Storage = snapshot.data!.docs[index]['Product-Storage'];
                                        String Os = snapshot.data!.docs[index]['Product-operatingSystem'];
                                        String Power = snapshot.data!.docs[index]['Product-powerSupply'];
                                        return  Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                     DescriptionScreen(
                                                       id: Id,
                                                       image: Img,
                                                       price: Price,
                                                       name: Name,
                                                       battery: Battery ,
                                                       display: Display,
                                                       memory: Memory,
                                                       processor: Processor,
                                                       storage: Storage,
                                                       operatingSystem: Os,
                                                       power: Power,),));
                                              },
                                              child: Container(
                                                width: 350,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Color(0xffffffff),

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
                                                                  image: NetworkImage("$Img")),

                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: (){

                                                              setState(() {
                                                                isProductInWishlist = !isProductInWishlist;
                                                              });
                                                              String prodId = Uuid().v1();
                                                              if (isProductInWishlist) {


                                                                  Map<String, dynamic> productDetail = {
                                                                    "FavProd-Id": prodId,
                                                                    "ProductList-Id": Id.toString(),
                                                                    "FavProd-Name": Name.toString(),
                                                                    "FavProd-Brand": Brand.toString(),
                                                                    "FavProd-Image": Img.toString(),
                                                                    "FavProd-Price": Price.toString(),
                                                                    "FavProd-Battery": Battery.toString(),
                                                                    "FavProd-Display": Display.toString(),
                                                                    "FavProd-Memory": Memory.toString(),
                                                                    "FavProd-Processor": Processor.toString(),
                                                                    "FavProd-Storage": Storage.toString(),
                                                                    "FavProd-Os": Os.toString(),
                                                                    "FavProd-Power": Power.toString(),
                                                                  };
                                                                  FirebaseFirestore.instance.collection("Favourites").doc(prodId).set(productDetail);

                                                              } else {
                                                                FirebaseFirestore.instance.collection("Favourites").doc(prodId).delete();
                                                              }


                                                              // void removeProductFromWishlist(String productId) async {
                                                              //   await FirebaseFirestore.instance.collection("Favourites").doc(productId).delete();
                                                              // }
                                                            },
                                                            child: Container(
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
                                                                child:isProductInWishlist ? Icon(CupertinoIcons.heart_fill,color: Color(0xf0003333)):
                                                                Icon(CupertinoIcons.heart,color: Color(0xf0003333))
                                                            ),
                                                          ),

                                                        ],),
                                                      // SizedBox(height: 30,),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 6,left: 10,right: 10),
                                                        child: Text("$Name",style: GoogleFonts.poppins(
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
                                                          Text("\$$Price",style: GoogleFonts.poppins(
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
