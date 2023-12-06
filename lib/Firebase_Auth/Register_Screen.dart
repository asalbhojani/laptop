import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptop/Firebase_Auth/Login_Screen.dart';
import 'package:uuid/uuid.dart';

import '../Profile_Firebase_Firestore/Profile_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void userInsertwithImage()async{
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot .ref.getDownloadURL();
    userInsert(imageUrl: downloadUrl);
  }
  void userInsert({ String? imageUrl})async{
    String userId = Uuid().v1();
    Map<String, dynamic> userDetail = {
      "User-Id": userId,
      "User-Name": firstname.text.toString(),
      "User-LName": lastname.text.toString(),
      "User-Email": email.text.toString(),
      "User-Image": imageUrl,
      "User-Contact": contact.text.toString(),
      "User-Password": password.text.toString(),
    };
    FirebaseFirestore.instance.collection("userData").doc(userId).set(userDetail);
  }

  File? userProfile;

  bool passHide = true;

  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    contact.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {

    void createUser()async{
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.toString(), password: password.text.toString());
      } on FirebaseAuthException catch(ex){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));
      }
    }
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
                      image: AssetImage('assets/images/registration.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xf0003333),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)) ),
                  width: double.infinity,
                  height: 800,
                  child:   Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30 , top: 20),
                        width: double.infinity,
                        child: Text("Register" , style: GoogleFonts.abyssinicaSil(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 30 ),
                        width: double.infinity,
                        child: Text("Welcome back, Please Register To Your Account" , style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ),
                      const SizedBox(height: 5,),

                          GestureDetector(
                            onTap: ()async{
                              XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                              if (selectedImage != null){
                                File convertedImage = File(selectedImage.path);
                                setState(() {
                                  userProfile = convertedImage;
                                });
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Not Selected")));
                              }
                            },
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue,
                              backgroundImage: userProfile!=null?FileImage(userProfile!):null,
                            ),
                          ),

                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Stack(
                              children:[
                                Container(
                                  width: 300,
                                  height: 480,
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
                                                border:  Border(bottom: BorderSide(color: Color(0xf0003333)))
                                            ),
                                            child: TextFormField(
                                              controller: firstname,
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
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color(0xf0003333)))
                                            ),
                                            child: TextFormField(
                                              controller: lastname,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Last Name is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Last Name",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.person_2_outlined,color: Color(0xf0003333),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color(0xf0003333)))
                                            ),
                                            child: TextFormField(
                                              controller: email,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Email is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Email",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.email,color: Color(0xf0003333),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color(0xf0003333)))
                                            ),
                                            child: TextFormField(
                                              controller: contact,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Contact is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Contact Number",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.contact_page_outlined,color: Color(0xf0003333),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(

                                              controller: password,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Password is required";
                                                }
                                              },
                                              obscureText: passHide==true?true:false,
                                              obscuringCharacter: "*",
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Password",
                                                suffixIcon: IconButton(onPressed: (){
                                                  setState(() {
                                                    passHide =! passHide;
                                                  });
                                                }, icon: passHide==true? Icon(Icons.remove_red_eye):Icon(Icons.key)),
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.password,color: Color(0xf0003333),),
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
                                          createUser();
                                          userInsertwithImage();
                                          if(_formkey.currentState!.validate()){
                                            print(firstname.text.toString());
                                            print(lastname.text.toString());
                                            print(email.text.toString());
                                            print(contact.text.toString());
                                            print(password.text.toString());

                                            Navigator.push(context, MaterialPageRoute(builder: (context) => profileScreen(),));
                                            child: const Text("Login");
                                          }
                                        }, child: Container(
                                      margin: EdgeInsets.only(left: 50 , top: 450),
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Color(0xf0003333),
                                                Colors.black
                                              ]
                                          )
                                      ),
                                      child: const Center(
                                        child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20), ),
                                      ),
                                    )
                                    )

                                  ],
                                )
                              ]
                          ),
                          SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Have an Account ? ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white ,fontWeight: FontWeight.w300),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
                                },
                                child:Text("SignIn",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700),),
                              ),
                            ],
                          )



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
