// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class test extends StatefulWidget {
//   const test({super.key});
//
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   List<String> _buttons = ['HP', 'Dell', 'Lenovo', 'Alienware', 'Asus'];
//   String _selectedButton = '';
//   int selectedIndex = 0;
//
//   Future<void> _getData(String button) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
//         'Product-Data').where('brand', isEqualTo: button).get();
//     setState(() {
//       _selectedButton = querySnapshot.docs[0]['data'];
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: _buttons.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                       _getData(_buttons[index]);
//                     },
//                     child:
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                       child: ElevatedButton(
//                         onPressed: (){
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                               selectedIndex == index ? Color(0xf001174d) : Color(0xffffffff),
//                             ),
//                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(11),
//                                     side: BorderSide(color: Color(0xf969696))
//                                 ))
//                         ),
//                         child:Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.chair_alt_outlined, color: selectedIndex == index ? Color(0xffffffff) :
//                               Color(0xf0000000),),
//                               SizedBox(width: 5,),
//                               Text(_buttons[index], style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                                 color: selectedIndex == index ? Color(0xffffffff) :
//                                 Color(0xf0000000),
//                               ),)
//                             ],),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 _selectedButton,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }

