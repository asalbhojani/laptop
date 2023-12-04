import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/Profile_Firebase_Firestore/Profile_Screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:IconButton(onPressed: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profileScreen()),
        );},
            icon: const Icon(Icons.arrow_circle_left,color: Colors.black,)),
        title: Center(
          child: Text("Edit Profile",style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),),
        ),

      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Stack(
                children: [

                  SizedBox(
                    width: 120, height: 120,

                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image(image: NetworkImage("https://img.freepik.com/premium-photo/memoji-beautiful-girl-woman-white-background-emoji_826801-6867.jpg"))
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.purple.withOpacity(0.1)
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 10,),
              Form(child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Full Name"),
                        suffixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Email"),
                        suffixIcon: Icon(Icons.mail_lock)
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Password"),
                        suffixIcon: Icon(Icons.password_outlined)
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profileScreen()),
                    );
                  }, child:Text("Edit Profile",style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
                    style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide.none,
                        shape: StadiumBorder()),),
                ],

              ))
            ],
          ),
        ),


      ),
    );
  }
}
