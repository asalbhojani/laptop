import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Order_place_screen.dart';

class checkoutScreen extends StatefulWidget {
  const checkoutScreen({super.key});

  @override
  State<checkoutScreen> createState() => _checkoutScreenState();
}
class _checkoutScreenState extends State<checkoutScreen> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Address = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    Name.dispose();
    Email.dispose();
    Address.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Color(0xf0003333),
                ),

                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                      ),

                      child: new IconButton(
                          icon: new Icon(Icons.arrow_back,color: Colors.white,size: 35.0),onPressed: null),
                    ),

                    SizedBox(width: 110,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child:Text("MY CART",style:
                          GoogleFonts.abyssinicaSil(
                              color: Colors.white,
                              fontSize: 30,
                              backgroundColor: Color(0xf0003333),
                              fontWeight: FontWeight.w600
                          ),),
                        )
                      ],
                    ),


                  ],
                ),


              ],
            ),


            SizedBox(height: 10,),

           Column(
             children: [
               Stack(
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 30, right: 10),
                     width:350,
                     height: 300,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.black45),
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,

                       boxShadow: [
                         BoxShadow(
                           color: Color(0xf0003333),
                           blurRadius: 4,
                           offset: Offset(4, 8), // Shadow position
                         ),
                       ],
                     ),
                   ),
                   Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 130, top: 10),
                         child: Text("ORDER ITEM(s)",style: GoogleFonts.poppins(
                           fontSize: 25,
                           fontWeight: FontWeight.w700,
                         ),),
                       )
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 35,top: 50),
                         width: 90,
                         height: 90,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Colors.purple,
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: AssetImage("assets/images/slim.png"))
                         ),
                       ),
                       SizedBox(width: 10,),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: 35,top: 30),
                             width: 50,
                             height: 50,
                             child: Text("Name \n Price",style: GoogleFonts.poppins(
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                               color: Color(0xf0003333),
                             ),),
                           )


                         ],
                       ),
                     ],
                   ),

                   SizedBox(height: 10,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 35,top: 150),
                         width: 90,
                         height: 90,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Colors.purple,
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: AssetImage("assets/images/slim.png"))
                         ),
                       ),
                       SizedBox(width: 10,),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: 35,top: 150),
                             width: 50,
                             height: 50,
                             child: Text("Name \n Price",style: GoogleFonts.poppins(
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                               color: Color(0xf0003333),
                             ),),
                           )


                         ],
                       ),
                     ],
                   ),




                 ],
               ),
             ],
           ),
            SizedBox(height: 30,),

            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 10),
                  width:350,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        color: Color(0xf0003333),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],

                  ),

                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 110, top: 10),
                      child: Text("PAYMENT DETAIL",style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40,top: 70),
                      width: 100,
                      height: 110,
                      child: Text("Price",style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xf0003333),

                      ),),
                    ),
                    SizedBox(width: 30,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,top: 70),
                          width: 100,
                          height: 110,
                          child: Text("150000",style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xf0003333),

                          ),),
                        ),


                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40,top: 130),
                      width: 100,
                      height: 110,
                      child: Text("Taxes",style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xf0003333),

                      ),),
                    ),
                    SizedBox(width: 30,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,top: 130),
                          width: 100,
                          height: 110,
                          child: Text("18% Gst",style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xf0003333),

                          ),),
                        ),


                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40,top: 190),
                      width: 120,
                      height: 110,
                      child: Text("Shipping",style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xf0003333),

                      ),),
                    ),
                    SizedBox(width: 30,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40,top: 190),
                          width: 100,
                          height: 110,
                          child: Text("500",style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xf0003333),
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),


            SizedBox(height: 30,),

            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 10),
                  width:350,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        color: Color(0xf0003333),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],

                  ),


                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 80, top: 10),
                      child: Text("CUSTOMER DETAIL",style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 10,),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, ),
                      child: Form(
                        key: _formkey,

                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only( left: 50) ,
                              margin: EdgeInsets.only(top: 30),
                              width: 350,
                              decoration: const BoxDecoration(
                                  border:  Border(bottom: BorderSide(color: Color(0xf0003333), width: 10))
                              ),
                              child: TextFormField(
                                controller: Name,
                                validator: (value){
                                  if(value == null || value.isEmpty || value == " "){
                                    return "Name is Required";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Name",
                                  hintStyle: TextStyle(color: Colors.grey[700]),

                                  prefixIcon: const Icon(Icons.person,color: Color(0xf0003333),),
                                ),
                              ),
                            ),



                            Container(
                              padding: EdgeInsets.only( left: 50) ,
                              margin: EdgeInsets.only(top: 30),
                              width: 350,
                              decoration: const BoxDecoration(
                                  border:  Border(bottom: BorderSide(color: Color(0xf0003333), width: 10))
                              ),

                              child: TextFormField(
                                controller: Email,
                                validator: (value){
                                  if(value == null || value.isEmpty || value == " "){
                                    return "Email is required";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                  prefixIcon: const Icon(Icons.email,color: Color(0xf0003333),),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only( left: 50) ,
                              margin: EdgeInsets.only(top: 30),
                              width: 350,
                              decoration: const BoxDecoration(
                                  border:  Border(bottom: BorderSide(color: Color(0xf0003333), width: 10))
                              ),
                              child: TextFormField(
                                controller: Address,

                                validator: (value){
                                  if(value == null || value.isEmpty || value == " "){
                                    return "Address is required";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Address",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                  prefixIcon: const Icon(Icons.location_on,color: Color(0xf0003333),),
                                ),
                              ),
                            ),

                            SizedBox(height: 20,),


                            Row(
                              children: [
                                // GestureDetector(
                                //   onTap: (){
                                //     // checkoutdatainsert();
                                //     // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderplacedScreen(),));
                                //
                                //   },
                                //   child: Container(
                                //
                                //     margin: EdgeInsets.only(left: 100 , top:0),
                                //     width: 200,
                                //     height: 50,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(30),
                                //         gradient: const LinearGradient(
                                //             colors: [
                                //               Colors.black,
                                //               Color.fromRGBO(6, 27, 28,1),
                                //               Colors.black
                                //             ]
                                //         )
                                //     ),
                                //     child: const Center(
                                //       child: Text("Proceed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20), ),
                                //     ),
                                //   ),
                                // ),



                              ],
                            ),
                            SizedBox(height: 30,),

                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderplacedScreen(), ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 120 , top: 10),
                                    width: double.infinity,
                                    height: 70,
                                    color:Color(0xf0003333),
                                    child: Text("PAY ON DELIVERY" , style: GoogleFonts.alumniSans(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),),
                                  ),
                                )
                              ],
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),




                  ],
                )








              ],
            ),





      )
        );


  }
}
