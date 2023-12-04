import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laptop/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class RatingandReview extends StatefulWidget {
  const RatingandReview({Key? key}) : super(key: key);

  @override
  State<RatingandReview> createState() => _RatingandReviewState();
}

class _RatingandReviewState extends State<RatingandReview> {


  Future getUser()async{
    SharedPreferences userEmail = await SharedPreferences.getInstance();
    return userEmail.getString("UserLoggedIn");
  }
  String uEmail = '';

  @override
  void initState() {
    // TODO: implement initState
    getUser().then((value) {
      setState(() {
        uEmail = value;
      });
    });
    super.initState();
  }





  TextEditingController review = TextEditingController();

  // void InsertPReview ()async{
  //
  //   String productId = Uuid().v1();
  //
  //   Map<String , dynamic> productDetails ={
  //     "Review-Id":productId,
  //     "Review-message":review.text.toString(),
  //     "Star-Rating":Rating
  //   };
  //
  //   FirebaseFirestore.instance.collection("Product-Reviews").doc(productId).set(productDetails);
  //   // await FirebaseFirestore.instance.collection("userData").doc(userId).delete();
  // }


  double Rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          StreamBuilder(
              stream: FirebaseFirestore.instance.collection("userData").snapshots(),
              builder: (context,snapshot){

                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                if(snapshot.hasData){

                  var dataLength =snapshot.data!.docs.length;

                  return dataLength==0?Center(
                    child: Text("Nothing to show"),
                  ):ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (context,index){

                        String userId= snapshot.data!.docs[index].id;
                        String userName= snapshot.data!.docs[index]['User-Name'];

                        return  GestureDetector(

                          onTap: ()async{
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext dialogContext){
                                  return AlertDialog(
                                    title: Text("Ratings and Reviews"),
                                    content: Column(
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
                                                Rating = ratingvalue;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: (){
                                            Navigator.of(dialogContext).pop();
                                          },  child:Text("Not Now")
                                      ),
                                      ElevatedButton(
                                          child:Text("OK"),
                                          onPressed: ()async{

                                            String productId = Uuid().v1();

                                            Map<String , dynamic> productDetails ={
                                              "Review-Id":productId,
                                              "User-Id":userId,
                                              "User-Name":userName,
                                              "Review-message":review.text.toString(),
                                              "Star-Rating":Rating
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
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                              // color: Color(0xff002a62),
                            ),
                            child: Icon(Icons.message_rounded),
                          ),
                        );
                      }
                  );
                }

                return Container();
              }),


GestureDetector(
  onTap: () async {
    FirebaseAuth.instance.signOut();
    SharedPreferences userLoginDetails= await SharedPreferences.getInstance();
    userLoginDetails.clear();
    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
  },
  child: Text("Logout"),
),

          const SizedBox(
            height: 20,
          ),
          const Text(
            'Rating Bar',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          Center(
            child: RatingBar.builder(
              initialRating: Rating,
              ignoreGestures: true,
              unratedColor: Colors.grey,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 50.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              updateOnDrag: true,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (ratingvalue) {},
            ),
          ),
        ],
      ),
    );
  }
}
