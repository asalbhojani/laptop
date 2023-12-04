import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'Profile_Firebase_Firestore/Profile_Screen.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController feedback = TextEditingController();


  void feedbackinsert() async{
    String userID = Uuid().v1();
    Map<String, dynamic>  userFeedback ={

      "User-ID":userID,
      "User-Name": Name.text.toString(),
      "User-Email": Email.text.toString(),
      "User-Feedback": feedback.text.toString(),


    };
    await FirebaseFirestore.instance.collection("userFeedback").doc(userID).set(userFeedback);
  }

  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    Name.dispose();
    Email.dispose();
    feedback.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 600,
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/feedback.jpeg'),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 27, 28,1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)) ),
                  width: double.infinity,
                  height: 800,
                  child:   Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30 , top: 20),
                        width: double.infinity,
                        child: Text("Feedback" , style: GoogleFonts.abyssinicaSil(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        margin: const EdgeInsets.only(left: 30 ),
                        width: double.infinity,
                        child: Text("Welcome back, Please share your valuable feedback with us" , style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Stack(
                              children:[
                                Container(
                                  width: 300,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),


                                  child: Form(
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
                                                return "Email is Required";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter Email",
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
                                            controller: feedback,

                                            validator: (value){
                                              if(value == null || value.isEmpty || value == " "){
                                                return "Feedback is required";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter Feedback",
                                              hintStyle: TextStyle(color: Colors.grey[700]),
                                              prefixIcon: const Icon(Icons.feedback,color: Color.fromRGBO(6, 27, 28,1),),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ),

                                Column(
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        feedbackinsert();
                                        if(_formkey.currentState!.validate()){
                                          print(Name.text.toString());
                                          print(Email.text.toString());
                                          print(feedback.text.toString());

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => profileScreen(),));
                                          child: const Text("Feedback");
                                        }
                                      },

                                      child: Container(

                                        margin: EdgeInsets.only(left: 50 , top: 225),
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
                                          child: Text("FeedBack", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20), ),
                                        ),

                                      ),
                                    )


                                  ],
                                )
                              ]
                          ),
                          SizedBox(height: 30,),

                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
