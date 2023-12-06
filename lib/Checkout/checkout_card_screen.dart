import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'Order_place_screen.dart';

class checkoutCardScreen extends StatefulWidget {
  const checkoutCardScreen({super.key});

  @override
  State<checkoutCardScreen> createState() => _checkoutCardScreenState();
}

class _checkoutCardScreenState extends State<checkoutCardScreen> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController cardname = TextEditingController();


  void checkoutdatainsert() async{
    String userID = Uuid().v1();
    Map<String, dynamic>  checkout ={

      "User-ID":userID,
      "User-Name": Name.text.toString(),
      "User-Email": Email.text.toString(),
      "User-Address": Address.text.toString(),
      "User-Cardnumber": cardnumber.text.toString(),
      "User-Cardname":cardname.text.toString()

    };
    await FirebaseFirestore.instance.collection("checkoutData").doc(userID).set(checkout);
  }
  var _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    Name.dispose();
    Email.dispose();
    Address.dispose();
    cardnumber.dispose();
    cardname.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: new IconButton(
                      icon: new Icon(Icons.arrow_back,color: Color(0xf0003333),size: 35.0),onPressed: null),
                ),

                SizedBox(width: 110,),

                Text("CHECK OUT",style:
                GoogleFonts.poppins(
                    color: Color(0xf0003333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),),
              ],
            ),

            SizedBox(height: 5,),


            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 250,

              decoration:BoxDecoration(
                  color: Colors.white10,
                  image: DecorationImage(image: AssetImage('assets/images/creditcard.jpg'))
              ),
            ),


            Form(
              key: _formkey,

              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
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
                        prefixIcon: const Icon(Icons.person,color: Color.fromRGBO(6, 27, 28,1),),
                      ),
                    ),
                  ),



                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
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
                        prefixIcon: const Icon(Icons.email,color: Color.fromRGBO(6, 27, 28,1),),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
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
                        prefixIcon: const Icon(Icons.location_on,color: Color.fromRGBO(6, 27, 28,1),),
                      ),
                    ),
                  ),




                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
                    ),
                    child: TextFormField(

                      controller: cardnumber,

                      validator: (value){
                        if(value == null || value.isEmpty || value == " "){
                          return "Card Number is required";
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Credit Card Number",
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon: const Icon(Icons.add_card_rounded,color: Color.fromRGBO(6, 27, 28,1),),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1),

                        ))
                    ),
                    child: TextFormField(
                      controller: cardname,
                      validator: (value){
                        if(value == null || value.isEmpty || value == " "){
                          return "Card Holder's name is required";
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Card Holder Name",
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon: const Icon(Icons.drive_file_rename_outline,color: Color.fromRGBO(6, 27, 28,1),),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),


                  Row(
                    children: [

                      Text("TOTAL:",style:GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),

                      GestureDetector(
                        onTap: (){
                          checkoutdatainsert();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderplacedScreen(),));

                        },
                        child: Container(

                          margin: EdgeInsets.only(left: 100 , top:0),
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Color.fromRGBO(6, 27, 28,1),
                                    Colors.black
                                  ]
                              )
                          ),
                          child: const Center(
                            child: Text("Proceed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20), ),
                          ),
                        ),
                      ),



                    ],
                  )



                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
