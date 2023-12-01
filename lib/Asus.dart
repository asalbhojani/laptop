import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Asus extends StatefulWidget {
  const Asus({super.key});

  @override
  State<Asus> createState() => _AsusState();
}

class _AsusState extends State<Asus> {

  TextEditingController userSearch = TextEditingController();
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
                      height: 100,
                      color: Color(0xf0003333),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            width: 100,
                            height: 5,
                            padding: EdgeInsets.all(7.0),
                            margin: EdgeInsets.only(left: 150,top: 65),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(40)
                            ),
                          ),
                        ],),
                    ),


                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 80),
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


                          SizedBox(width: 140,),
                          Padding(
                            padding: EdgeInsets.only(right: 50,left: 50,top: 20),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  searchName = value;
                                });
                              },
                              style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xf0000000)),
                              decoration: InputDecoration(
                                // hintText: 'Search',
                                // hintStyle: TextStyle(color: Color(0xf0000000)),
                                contentPadding: EdgeInsets.only(left: 20,top: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Color(0xf0003333)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: Color(0xf0003333)),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    // perform search
                                  },
                                  icon: Icon(Icons.search, color: Color(0xf0003333),),
                                ),
                              ),
                              cursorColor: Color(0xf0000000),
                            ),
                          ),

                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Product-Data')
                                  .orderBy('Product-Brand')
                                  .startAt([searchName]).endAt([searchName ]).snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong');
                                }

                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data!.docs[index];
                                      return ListTile(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) => ProfileView(
                                          //             userId: data['id'],
                                          //           )),
                                          // );
                                        },
                                        leading: CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(data['Product-Image']),
                                        ),
                                        title: Text(data['Product-Name']),
                                        subtitle: Text(data['Product-Price']),
                                      );
                                    });
                              }),

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
                                        Text("Filter", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color:  Color(0xffffffff),
                                        ),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.expand_more, color:  Color(0xffffffff)),

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

                                        Text("Sort", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color:  Color(0xffffffff),
                                        ),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.expand_more, color:  Color(0xffffffff)),

                                      ],
                                    ),
                                  ),
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
                              stream: FirebaseFirestore.instance.collection("Product-Data").where('Product-Brand',isEqualTo: "ASUS")
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasData) {
                                  var dataLength = snapshot.data!.docs.length;
                                  return dataLength==0?Text("Nothing to Show"):
                                  ListView.builder(
                                    itemCount: dataLength,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      String name = snapshot.data!.docs[index]['Product-Name'];
                                      String img = snapshot.data!.docs[index]['Product-Image'];
                                      String price = snapshot.data!.docs[index]['Product-Price'];
                                      return
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                          child: GridView.count(
                                            crossAxisCount: 2,
                                            physics: const ScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 20,
                                            childAspectRatio: 300/450,
                                            children: List.generate(1, (index) => Stack(
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
                                                              SizedBox(width: 20,),
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
                                            )),

                                          ),
                                        );
                                    },);
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
