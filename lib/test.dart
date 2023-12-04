import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/main.dart';


class filterList extends StatefulWidget {

  String brandName;
  filterList({required this.brandName});

  @override
  State<filterList> createState() => _filterListState();
}

class _filterListState extends State<filterList> {
  var searchName = "";
  String? selectedPriceFilter;
  String? selectedStorageFilter;

  Stream<QuerySnapshot> getFilteredData() {
    CollectionReference collection =
    FirebaseFirestore.instance.collection("Product-Data");

    Query query =
    collection.where('Product-Brand', isEqualTo: widget.brandName);

    if (selectedPriceFilter != null) {
      if (selectedPriceFilter == "lowToHigh") {
        query = query.orderBy('Product-Price', descending: false);
      }
      if (selectedPriceFilter == "highToLow") {
        query = query.orderBy('Product-Price', descending: true);
      }
    }

    if (selectedStorageFilter != null) {
      if (selectedStorageFilter == "lowToHigh") {
        query = query.orderBy('Product-Storage', descending: false);
      }
      if (selectedStorageFilter == "highToLow") {
        query = query.orderBy('Product-Storage', descending: true);
      }
    }

    return query.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ... Your existing code

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 75, right: 20),
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async{
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: Text("Filter Options"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Price"),
                                DropdownButton<String>(
                                  value: selectedPriceFilter,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedPriceFilter = value;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "null",
                                      child: Text("None"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "lowToHigh",
                                      child: Text("Low to High"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "highToLow",
                                      child: Text("High to Low"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text("Storage"),
                                DropdownButton<String>(
                                  value: selectedStorageFilter,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedStorageFilter = value;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "null",
                                      child: Text("None"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "lowToHigh",
                                      child: Text("Low to High"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "highToLow",
                                      child: Text("High to Low"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(dialogContext).pop();
                                  },  child:Text("Not Now")
                              ),
                              TextButton(
                                onPressed: () {
                                  getFilteredData();
                                  Navigator.of(context).pop();
                                  // Call your filter logic here
                                  // This will trigger the StreamBuilder to update with new filters
                                },
                                child: Text("Apply Filters"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xffffffff)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(color: Color(0xf0003333)),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 4, vertical: 11),
                      child: Row(
                        children: [
                          Text(
                            "Filter",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color(0xf0000000),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.expand_more, color: Color(0xf0000000)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            StreamBuilder(
              stream: getFilteredData(),
                builder: (BuildContext context, snapshot) {
                  // Rest of the code remains unchanged

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
                          String name = snapshot.data!.docs[index]['Product-Name'];
                          String img = snapshot.data!.docs[index]['Product-Image'];
                          String price = snapshot.data!.docs[index]['Product-Price'];
                          return  Stack(
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
                                            SizedBox(width: 18,),
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
    );
  }

}






















//
// class filterList extends StatefulWidget {
//   String brandName;
//
//   filterList({required this.brandName});
//
//   @override
//   State<filterList> createState() => _filterListState();
// }
//
// class _filterListState extends State<filterList> {
//   var searchName = "";
//   String selectedPriceFilter = 'lowToHigh';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ... (Your existing code for the header)
//
//             Container(
//               margin: EdgeInsets.only(top: 20, left: 75, right: 20),
//               width: 105,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedPriceFilter =
//                     selectedPriceFilter == 'lowToHigh' ? 'highToLow' : 'lowToHigh';
//                   });
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(11),
//                       side: BorderSide(color: Color(0xf0003333)),
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 11),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Price",
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xf0000000),
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       Icon(Icons.arrow_downward,
//                           color: Color(0xf0000000),
//                           semanticLabel:
//                           selectedPriceFilter == 'lowToHigh' ? 'Low to High' : 'High to Low'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // ... (Your existing code for the Sort button)
//
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection("Product-Data")
//                   .where('Product-Brand', isEqualTo: widget.brandName)
//                   .orderBy('Product-Price', descending: selectedPriceFilter == 'highToLow')
//                   .snapshots(),
//               builder: (BuildContext context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//                 if (snapshot.hasError) {
//                   return Text("Error: ${snapshot.error}");
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Text("No Products Found");
//                 }
//
//                 var data = snapshot.data!.docs;
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     physics: const ScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     mainAxisSpacing: 20,
//                     crossAxisSpacing: 20,
//                     childAspectRatio: 280 / 450,
//                     children: List.generate(data.length, (index) {
//                       String name = data[index]['Product-Name'];
//                       String img = data[index]['Product-Image'];
//                       String price = data[index]['Product-Price'];
//                       return  Stack(
//                         children: [
//                           // Container(
//                           //    width: 30,
//                           //    height: 320,
//                           //    decoration: BoxDecoration(
//                           //      borderRadius: BorderRadius.circular(20),
//                           //      color: Color(0xff002a62),
//                           //        boxShadow: [
//                           //          BoxShadow(
//                           //            color: Color(0xff8f8989,),
//                           //            spreadRadius: 4,
//                           //            blurRadius: 10,
//                           //            offset: Offset(4, 4),
//                           //          )
//                           //        ]
//                           //    ),
//                           //  ),
//
//                           GestureDetector(
//                             onTap: (){
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=> sofaDescription(img: img[index], price: price[index], name: name[index]),));
//                             },
//                             child: Container(
//                               width: 350,
//                               height: 300,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: Color(0xffffffff),
//                                   // image: DecorationImage(
//                                   //     colorFilter: ColorFilter.mode(Color(
//                                   //         0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
//                                   //     fit: BoxFit.cover,
//                                   //     image: AssetImage("${img[index]}")),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(
//                                           0xf4a1a1a1),
//                                       spreadRadius: 1,
//                                       blurRadius: 5,
//                                       offset: Offset(1, 1),
//                                     )
//                                   ]
//                               ),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children:[
//                                     Stack(
//                                       children: <Widget>[
//
//                                         Container(
//                                           width: 200,
//                                           height: 170,
//                                           margin: EdgeInsets.only(top: 20),
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15),
//                                             color: Color(0xffffffff),
//                                             image: DecorationImage(
//                                                 colorFilter: ColorFilter.mode(Color(
//                                                     0xffffffff).withOpacity(0.2), BlendMode.darken),
//                                                 fit: BoxFit.cover,
//                                                 image: NetworkImage("$img")),
//                                             // boxShadow: [
//                                             //   BoxShadow(
//                                             //     color: Color( 0xf44d4d4d),
//                                             //     spreadRadius: 1,
//                                             //     blurRadius: 5,
//                                             //     offset: Offset(1, 1),
//                                             //   )
//                                             // ]
//                                           ),
//                                         ),
//                                         Container(
//                                             width: 40,
//                                             height: 33,
//                                             margin: EdgeInsets.only(left: 135,right: 5,top: 5),
//                                             decoration: BoxDecoration(
//
//                                                 shape: BoxShape.circle,
//                                                 color: Color(0xffffffff),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color:  Color(
//                                                         0xf3c4c4c4),
//                                                     spreadRadius: 1,
//                                                     blurRadius: 5,
//                                                     offset: Offset(2, 2),
//                                                   )
//                                                 ]
//                                               // border: Border.all(color: Color(0xffa19e9e))
//                                             ),
//                                             child: Icon(CupertinoIcons.heart,color: Color(0xf0003333))
//                                         ),
//
//                                       ],),
//                                     // SizedBox(height: 30,),
//                                     Container(
//                                       margin: EdgeInsets.only(top: 6,left: 10,right: 10),
//                                       child: Text("$name",style: GoogleFonts.poppins(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                         color:Theme.of(context).iconTheme.color,
//                                       ),),
//                                     ),
//
//                                     Row(
//                                       children: [
//                                         SizedBox(width: 10,),
//                                         Icon(Icons.star_outline_rounded,color: Color(
//                                             0xf0343434)),
//                                         SizedBox(width: 5,),
//                                         Text("5.00", style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w600,
//                                           color:  Color(0xf0343434),
//                                         ),),
//                                         SizedBox(width: 18,),
//                                         Text("\$$price",style: GoogleFonts.poppins(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                           color: Color(0xf0003333),
//                                         ),),
//                                       ],
//                                     ),
//                                   ]),
//                             ),
//                           ),
//                         ],
//                       );
//                     }),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
































// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Products(),
//     );
//   }
// }
//
// class Products extends StatefulWidget {
//   @override
//   _ProductsState createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   String _filter = 'All';
//   List<Map<String, dynamic>> _products = [];
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection('Product-Data')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         setState(() {
//           _products.add(doc.data());
//         });
//       });
//     });
//   }
//
//   void _onFilterChanged(String value) {
//     setState(() {
//       _filter = value;
//     });
//   }
//
//   List<Map<String, dynamic>> _applyFilter(List<Map<String, dynamic>> products) {
//     if (_filter == 'All') {
//       return products;
//     } else if (_filter == 'Low to High') {
//       return products..sort((a, b) => a['Product-Price'].compareTo(b['Product-Price']));
//     } else if (_filter == 'High to Low') {
//       return products..sort((a, b) => b['Product-Price'].compareTo(a['Product-Price']));
//     } else if (_filter == 'Low to High Storage') {
//       return products..sort((a, b) => a['Product-Storage'].compareTo(b['Product-Storage']));
//     } else if (_filter == 'High to Low Storage') {
//       return products..sort((a, b) => b['Product-Storage'].compareTo(a['Product-Storage']));
//     }
//     return products;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//         actions: [
//           DropdownButton(
//             value: _filter,
//             items: [
//               DropdownMenuItem(child: Text('All'), value: 'All'),
//               DropdownMenuItem(child: Text('Low to High'), value: 'Low to High'),
//               DropdownMenuItem(child: Text('High to Low'), value: 'High to Low'),
//               DropdownMenuItem(child: Text('Low to High Storage'), value: 'Low to High Storage'),
//               DropdownMenuItem(child: Text('High to Low Storage'), value: 'High to Low Storage'),
//             ],
//             onChanged: _onFilterChanged,
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         itemCount: _applyFilter(_products).length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.0,
//           mainAxisSpacing: 4.0,
//           crossAxisSpacing: 4.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           final Map<String, dynamic> product = _applyFilter(_products)[index];
//           return Card(
//             margin: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage("${product['img']}"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                     "${product['Product-Name']}"),
//                 Text(
//                   "₹${product['Product-Price']}",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "${product['Product-Storage']}GB",
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Products extends StatefulWidget {
//   @override
//   _ProductsState createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late Query _productsQuery;
//
//   @override
//   void initState() {
//     super.initState();
//     _productsQuery = _firestore.collection('Product-Data');
//   }
//
//   void _onFilter(String value) {
//     if (value == 'lowToHigh') {
//       setState(() {
//         _productsQuery = _firestore.collection('Product-Data').orderBy('Product-Price');
//       });
//     } else if (value == 'highToLow') {
//       setState(() {
//         _productsQuery = _firestore.collection('Product-Data').orderBy('Product-Price', descending: true);
//       });
//     } else if (value == 'lowToHighStorage') {
//       setState(() {
//         _productsQuery = _firestore.collection('Product-Data').orderBy('Product-Storage');
//       });
//     } else if (value == 'highToLowStorage') {
//       setState(() {
//         _productsQuery = _firestore.collection('Product-Data').orderBy('Product-Storage', descending: true);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(width: 10),
//                 Text('Products', style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Theme.of(context).iconTheme.color,
//                 ),),
//                 DropdownButton<String>(
//                   value: _selectedValue,
//                   onChanged: _onFilter,
//                   items: [
//                     DropdownMenuItem(
//                       value: 'lowToHigh',
//                       child: Text('Price Low to High'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'highToLow',
//                       child: Text('Price High to Low'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'lowToHighStorage',
//                       child: Text('Storage Low to High'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'highToLowStorage',
//                       child: Text('Storage High to Low'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: _productsQuery.snapshots(),
//                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(child: Text('Something went wrong'));
//                   }
//
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//
//                   return ListView(
//                     children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                       return ListTile(
//                         title: Text(document['Product-Name']),
//                         subtitle: Text('\$${document['Product-Price']} - ${document['Product-Storage']}GB'),
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class ProductsPage extends StatefulWidget {
//   String brandName;
//   ProductsPage({required this.brandName});
//   @override
//   _ProductsPageState createState() => _ProductsPageState();
// }
//
// class _ProductsPageState extends State<ProductsPage> {
//   List<DropdownMenuItem<String>> priceList = [];
//   List<DropdownMenuItem<String>> storageList = [];
//
//   late String selectedPrice;
//   late String selectedStorage;
//
//   @override
//   void initState() {
//     super.initState();
//     priceList = getPriceList();
//     storageList = getStorageList();
//     selectedPrice = priceList[0].value!;
//     selectedStorage = storageList[0].value!;
//   }
//
//   List<DropdownMenuItem<String>> getPriceList() {
//     return [
//       DropdownMenuItem(
//       value: 'All',
//       child: Text('Price'),
//     ),
//       DropdownMenuItem(
//         value: 'low_to_high',
//         child: Text('Low to High'),
//       ),
//       DropdownMenuItem(
//         value: 'high_to_low',
//         child: Text('High to Low'),
//       ),
//     ];
//   }
//
//   List<DropdownMenuItem<String>> getStorageList() {
//     return [
//       DropdownMenuItem(
//         value: 'All',
//         child: Text('Storage'),
//       ),
//       DropdownMenuItem(
//         value: 'low_to_high',
//         child: Text('Low to High'),
//       ),
//       DropdownMenuItem(
//         value: 'high_to_low',
//         child: Text('High to Low'),
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//         actions: [
//           DropdownButton(
//             value: selectedPrice,
//             items: priceList,
//             onChanged: (value) {
//               setState(() {
//                 selectedPrice = value!;
//               });
//             },
//           ),
//           DropdownButton(
//             value: selectedStorage,
//             items: storageList,
//             onChanged: (value) {
//               setState(() {
//                 selectedStorage = value!;
//               });
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection("Product-Data").where('Product-Brand',isEqualTo: widget.brandName)
//            /* .orderBy('Product-Price', descending: selectedPrice == 'high_to_low')
//             .orderBy('Product-Storage', descending: selectedStorage == 'high_to_low')*/
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var data = snapshot.data!.docs[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(data['Product-Image']),
//                   ),
//                   title: Text(data['Product-Name']),
//                   subtitle: Text(
//                     'Price: \$${data['price']} - Storage: ${data['storage']}',
//                   ),
//                 );
//               },
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }








// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class FilterPopup extends StatefulWidget {
//
//
//   @override
//   _FilterPopupState createState() => _FilterPopupState();
// }
//
// class _FilterPopupState extends State<FilterPopup> {
//   bool priceFilterLowToHigh = false;
//   bool priceFilterHighToLow = false;
//   bool storageFilterLowToHigh = false;
//   bool storageFilterHighToLow = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: _buildContent(context),
//     );
//   }
//
//   Widget _buildContent(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.only(top: 15),
//       margin: EdgeInsets.only(top: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Filter By',
//             style: GoogleFonts.poppins(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Price',
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 10),
//           ListTile(
//             leading: Radio(
//               value: true,
//               groupValue: priceFilterLowToHigh,
//               onChanged: (value) {
//                 setState(() {
//                   priceFilterLowToHigh = true;
//                   priceFilterHighToLow = false;
//                 });
//               },
//             ),
//             title: Text('Low to High'),
//           ),
//           ListTile(
//             leading: Radio(
//               value: true,
//               groupValue: priceFilterHighToLow,
//               onChanged: (value) {
//                 setState(() {
//                   priceFilterHighToLow = true;
//                   priceFilterLowToHigh = false;
//                 });
//               },
//             ),
//             title: Text('High to Low'),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Storage',
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 10),
//           ListTile(
//             leading: Radio(
//               value: true,
//               groupValue: storageFilterLowToHigh,
//               onChanged: (value) {
//                 setState(() {
//                   storageFilterLowToHigh = true;
//                   storageFilterHighToLow = false;
//                 });
//               },
//             ),
//             title: Text('Low to High'),
//           ),
//           ListTile(
//             leading: Radio(
//               value: true,
//               groupValue: storageFilterHighToLow,
//               onChanged: (value) {
//                 setState(() {
//                   storageFilterHighToLow = true;
//                   storageFilterLowToHigh = false;
//                 });
//               },
//             ),
//             title: Text('High to Low'),
//           ),
//           SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'Apply',
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.orange,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// \end{code}
//
// To call the `FilterPopup`, you can use `showDialog`:
//
// \begin{code}
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return FilterPopup(data: yourData);
// },
// );
// \end{code}
//
// Just make sure to replace `yourData` with the actual list of documents.
//
// You may need to modify this code based on your actual requirements and the structure of your documents.
//





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Products extends StatefulWidget {
//   @override
//   _ProductsState createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   List<DocumentSnapshot> _products = [];
//   String _dropdownValue = 'All Products';
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance.collection('Product-Data').get().then((data) {
//       setState(() {
//         _products = data.docs;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//         actions: <Widget>[
//           DropdownButton<String>(
//             value: _dropdownValue,
//             icon: Icon(Icons.arrow_downward),
//             iconSize: 24,
//             elevation: 16,
//             style: TextStyle(color: Colors.white),
//             underline: Container(
//               height: 2,
//               color: Colors.white,
//             ),
//             onChanged: (var value) {
//               setState(() {
//                 _dropdownValue = value!;
//               });
//             },
//             items: <String>['All Products', 'HP', 'DELL', 'ASUS']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: _products.length,
//         itemBuilder: (BuildContext context, int index) {
//           bool displayProduct = _dropdownValue == 'All Products' ||
//               _products[index]['Product-Brand'] == _dropdownValue;
//           if (displayProduct) {
//             return ListTile(
//               title: Text(_products[index]['Product-Name'],style: GoogleFonts.poppins(color: Colors.orange),),
//               subtitle: Text(_products[index]['Product-Name']),
//             );
//           } else {
//             return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }












// import 'package:flutter/material.dart';
//
// class dropdown extends StatefulWidget {
//   const dropdown({super.key});
//
//   @override
//   State<dropdown> createState() => _dropdownState();
// }
//
// class _dropdownState extends State<dropdown> {
//   List<Map<String, dynamic>> Data = [
//     {'name': 'Luxury ArmChair', 'price': '48', 'img': 'assets/img/chairOrange.png'},
//     {'name': 'Luxury Sofa',     'price': '60', 'img': 'assets/img/sofa.png'},
//     {'name': 'Luxury Table',    'price': '30', 'img': 'assets/img/table6.png'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }






















// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class products extends StatefulWidget {
//   const products({super.key});
//
//   @override
//   State<products> createState() => _productsState();
// }
//
// class _productsState extends State<products> {
//
//
//   List img= ['assets/img/sofa.png',
//     'assets/img/sofa1.png',
//     'assets/img/sofa2.png',
//     'assets/img/sofa3.png',
//     'assets/img/sofa4.png',
//     'assets/img/sofa5.png',
//     'assets/img/sofa6.png',
//     'assets/img/sofa7.png',
//     'assets/img/sofa8.png',
//   ];
//
//   List name=['Luxury Blue ArmChair',
//     'Luxury Torqoise Chair',
//     'Luxury Orange Chair',
//     'Royal Black Chair',
//     'Luxury ArmChair',
//     'Luxury Pink Chair',
//     'Royal Grey Chair',
//     'Luxury Grey Chair',
//     'Luxury Grey Chair',
//   ];
//
//   List price=['74','61','88','96','83','69','86','88','83'];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//         body:SingleChildScrollView(
//
//           child: Column(
//             children: [
//
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.only(top: 80),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(25),
//                         topLeft: Radius.circular(25)
//                     )
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         physics: const ScrollPhysics(),
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 10,
//                         childAspectRatio: 300/450,
//                         children: List.generate(img.length, (index) => Stack(
//                           children: [
//                             // Container(
//                             //    width: 30,
//                             //    height: 320,
//                             //    decoration: BoxDecoration(
//                             //      borderRadius: BorderRadius.circular(20),
//                             //      color: Color(0xff002a62),
//                             //        boxShadow: [
//                             //          BoxShadow(
//                             //            color: Color(0xff8f8989,),
//                             //            spreadRadius: 4,
//                             //            blurRadius: 10,
//                             //            offset: Offset(4, 4),
//                             //          )
//                             //        ]
//                             //    ),
//                             //  ),
//
//                             GestureDetector(
//                               onTap: (){
//                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=> sofaDescription(img: img[index], price: price[index], name: name[index]),));
//                               },
//                               child: Container(
//                                 width: 350,
//                                 height: 300,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: Color(0xffffffff),
//                                     // image: DecorationImage(
//                                     //     colorFilter: ColorFilter.mode(Color(
//                                     //         0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
//                                     //     fit: BoxFit.cover,
//                                     //     image: AssetImage("${img[index]}")),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Color( 0xf44d4d4d),
//                                         spreadRadius: 1,
//                                         blurRadius: 5,
//                                         offset: Offset(1, 1),
//                                       )
//                                     ]
//                                 ),
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children:[
//                                       Stack(
//                                         children: <Widget>[
//
//                                           Container(
//                                             width: 300,
//                                             height: 170,
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(15),
//                                                 color: Color(0xffffffff),
//                                                 // image: DecorationImage(
//                                                 //     colorFilter: ColorFilter.mode(Color(
//                                                 //         0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
//                                                 //     fit: BoxFit.cover,
//                                                 //     image: AssetImage("${img[index]}")),
//                                                 // boxShadow: [
//                                                 //   BoxShadow(
//                                                 //     color: Color( 0xf44d4d4d),
//                                                 //     spreadRadius: 1,
//                                                 //     blurRadius: 5,
//                                                 //     offset: Offset(1, 1),
//                                                 //   )
//                                                 // ]
//                                             ),
//                                           ),
//                                           Container(
//                                               width: 40,
//                                               height: 33,
//                                               margin: EdgeInsets.only(left: 125,right: 10,top: 5),
//                                               decoration: BoxDecoration(
//
//                                                   shape: BoxShape.circle,
//                                                   color: Theme.of(context).primaryColor,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color:  Color(0xf343434),
//                                                       spreadRadius: 1,
//                                                       blurRadius: 5,
//                                                       offset: Offset(2, 2),
//                                                     )
//                                                   ]
//                                                 // border: Border.all(color: Color(0xffa19e9e))
//                                               ),
//                                               child: Icon(CupertinoIcons.heart,color: Color(0xffff6d40))
//                                           ),
//
//                                         ],),
//                                       // SizedBox(height: 30,),
//                                       Container(
//                                         margin: EdgeInsets.only(top: 30,left: 20),
//                                         child: Text("${name[index]}",style: GoogleFonts.poppins(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color:Theme.of(context).iconTheme.color,
//                                         ),),
//                                       ),
//
//                                       Row(
//                                         children: [
//                                           SizedBox(width: 20,),
//                                           Icon(Icons.star_outline_rounded,color: Color(
//                                               0xf0343434)),
//                                           SizedBox(width: 5,),
//                                           Text("5.00", style: GoogleFonts.poppins(
//                                             fontWeight: FontWeight.w600,
//                                             color:  Color(0xf0343434),
//                                           ),),
//                                           SizedBox(width: 60,),
//                                           Text("\$${price[index]}",style: GoogleFonts.poppins(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xffff6d40),
//                                           ),),
//                                         ],
//                                       ),
//                                     ]),
//                               ),
//                             ),
//                           ],
//                         )),
//
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//
//         ));
//   }
// }
//
//
// //
// // class test extends StatefulWidget {
// //   const test({super.key});
// //
// //   @override
// //   State<test> createState() => _testState();
// // }
// //
// // class _testState extends State<test> {
// //   List<String> _buttons = ['HP', 'Dell', 'Lenovo', 'Alienware', 'Asus'];
// //   String _selectedButton = '';
// //   int selectedIndex = 0;
// //
// //   Future<void> _getData(String button) async {
// //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
// //         'Product-Data').where('brand', isEqualTo: button).get();
// //     setState(() {
// //       _selectedButton = querySnapshot.docs[0]['data'];
// //     });
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Column(
// //           children: [
// //             SizedBox(
// //               height: 50,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: _buttons.length,
// //                 itemBuilder: (context, index) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       setState(() {
// //                         selectedIndex = index;
// //                       });
// //                       _getData(_buttons[index]);
// //                     },
// //                     child:
// //                     Container(
// //                       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
// //                       child: ElevatedButton(
// //                         onPressed: (){
// //                           setState(() {
// //                             selectedIndex = index;
// //                           });
// //                         },
// //                         style: ButtonStyle(
// //                             backgroundColor: MaterialStateProperty.all(
// //                               selectedIndex == index ? Color(0xf001174d) : Color(0xffffffff),
// //                             ),
// //                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                                 RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(11),
// //                                     side: BorderSide(color: Color(0xf969696))
// //                                 ))
// //                         ),
// //                         child:Padding(
// //                           padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
// //                           child: Row(
// //                             children: [
// //                               Icon(Icons.chair_alt_outlined, color: selectedIndex == index ? Color(0xffffffff) :
// //                               Color(0xf0000000),),
// //                               SizedBox(width: 5,),
// //                               Text(_buttons[index], style: GoogleFonts.poppins(
// //                                 fontWeight: FontWeight.w500,
// //                                 color: selectedIndex == index ? Color(0xffffffff) :
// //                                 Color(0xf0000000),
// //                               ),)
// //                             ],),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Container(
// //               padding: EdgeInsets.all(16),
// //               child: Text(
// //                 _selectedButton,
// //                 style: TextStyle(fontSize: 18),
// //               ),
// //             ),
// //           ],
// //         )
// //     );
// //   }
// // }
// //
// // class CarouselSliderExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: CarouselSlider(
// //         items: [
// //
// // //First Slider
// //
// //           Container(
// //             width: 700,
// //             // margin: EdgeInsets.symmetric(horizontal: 20),
// //             // color: Colors.orange,
// //             height: 240,
// //             child:
// //
// //             Row(
// //                 children: [
// //                   Stack(
// //                     children:[
// //
// //                       Container(
// //                         margin: EdgeInsets.only(left:120,bottom: 50),
// //                         // padding: EdgeInsets.only(left: 10),
// //                         width: 200,
// //                         height: 300,
// //                         // color: Colors.cyan,
// //                         child: Image.asset("assets/images/carousel3.png"),
// //                       ),
// //
// //
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             width: 170,
// //                             height: 30,
// //                             // color: Colors.cyan,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name', style: GoogleFonts.poppins(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.w500,
// //                               color: Color(0xf0a9a9a9),
// //                             ),),
// //                           ),
// //                           Container(
// //                             width: 170,
// //                             height: 80,
// //                             // color: Colors.lightBlue,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.w600,
// //                               color: Color(0xf0171717),
// //                             ),),
// //                           ),
// //
// //                           GestureDetector(
// //                             onTap: (){},
// //                             child: Container(
// //                               padding: EdgeInsets.only(left: 18,top: 7),
// //                               width: 100,
// //                               height: 40,
// //                               decoration: BoxDecoration(
// //                                   color: Color(0xf0003333),
// //                                   borderRadius: BorderRadius.circular( 20)
// //                               ),
// //                               child: Text("Buy Now",style: GoogleFonts.poppins(
// //                                 fontSize: 15,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: Color(0xf0ffffff),
// //                               ),),
// //                             ),
// //                           )
// //
// //                         ],),
// //
// //
// //
// //                     ],),
// //                 ]),
// //           ),
// //
// //
// // //second slider
// //
// //           Container(
// //             width: 700,
// //             // margin: EdgeInsets.symmetric(horizontal: 20),
// //             // color: Colors.orange,
// //             height: 240,
// //             child:
// //
// //             Row(
// //                 children: [
// //                   Stack(
// //                     children:[
// //
// //                       Container(
// //                         margin: EdgeInsets.only(left:120,bottom: 50),
// //                         // padding: EdgeInsets.only(left: 10),
// //                         width: 200,
// //                         height: 350,
// //                         // color: Colors.cyan,
// //                         child: Image.asset("assets/images/carousel1.png"),
// //                       ),
// //
// //
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             width: 170,
// //                             height: 30,
// //                             // color: Colors.cyan,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name', style: GoogleFonts.poppins(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.w500,
// //                               color: Color(0xf0a9a9a9),
// //                             ),),
// //                           ),
// //                           Container(
// //                             width: 170,
// //                             height: 80,
// //                             // color: Colors.lightBlue,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.w600,
// //                               color: Color(0xf0171717),
// //                             ),),
// //                           ),
// //
// //                           GestureDetector(
// //                             onTap: (){},
// //                             child: Container(
// //                               padding: EdgeInsets.only(left: 18,top: 7),
// //                               width: 100,
// //                               height: 40,
// //                               decoration: BoxDecoration(
// //                                   color: Color(0xf0003333),
// //                                   borderRadius: BorderRadius.circular( 20)
// //                               ),
// //                               child: Text("Buy Now",style: GoogleFonts.poppins(
// //                                 fontSize: 15,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: Color(0xf0ffffff),
// //                               ),),
// //                             ),
// //                           )
// //
// //                         ],),
// //
// //
// //
// //                     ],),
// //                 ]),
// //           ),
// //
// // //Third Slider
// //
// //           Container(
// //             width: 700,
// //             // margin: EdgeInsets.symmetric(horizontal: 20),
// //             // color: Colors.orange,
// //             height: 240,
// //             child:
// //
// //             Row(
// //                 children: [
// //                   Stack(
// //                     children:[
// //
// //                       Container(
// //                         margin: EdgeInsets.only(left:120,bottom: 50),
// //                         // padding: EdgeInsets.only(left: 10),
// //                         width: 200,
// //                         height: 350,
// //                         // color: Colors.cyan,
// //                         child: Image.asset("assets/images/carousel7.jpg"),
// //                       ),
// //
// //
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             width: 170,
// //                             height: 30,
// //                             // color: Colors.cyan,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name', style: GoogleFonts.poppins(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.w500,
// //                               color: Color(0xf0a9a9a9),
// //                             ),),
// //                           ),
// //                           Container(
// //                             width: 170,
// //                             height: 80,
// //                             // color: Colors.lightBlue,
// //                             // margin: EdgeInsets.symmetric(horizontal: 15),
// //                             child: Text('laptop name Laptop Statement', style: GoogleFonts.poppins(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.w600,
// //                               color: Color(0xf0171717),
// //                             ),
// //                               // softWrap: true,
// //                             ),
// //                           ),
// //
// //                           GestureDetector(
// //                             onTap: (){},
// //                             child: Container(
// //                               padding: EdgeInsets.only(left: 18,top: 7),
// //                               width: 100,
// //                               height: 40,
// //                               decoration: BoxDecoration(
// //                                   color: Color(0xf0003333),
// //                                   borderRadius: BorderRadius.circular( 20)
// //                               ),
// //                               child: Text("Buy Now",style: GoogleFonts.poppins(
// //                                 fontSize: 15,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: Color(0xf0ffffff),
// //                               ),),
// //                             ),
// //                           )
// //
// //                         ],),
// //
// //
// //
// //                     ],),
// //                 ]),
// //           ),
// //
// //
// //
// //           // Container(
// //           //   margin: EdgeInsets.all(8.0),
// //           //   decoration: BoxDecoration(
// //           //     borderRadius: BorderRadius.circular(10.0),
// //           //     image: DecorationImage(
// //           //       image: NetworkImage("https://img.freepik.com/free-photo/digital-painting-mountain-with-colorful-tree-foreground_1340-25699.jpg"),
// //           //       fit: BoxFit.cover,
// //           //     ),
// //           //   ),
// //           // ),
// //           // Container(
// //           //   margin: EdgeInsets.all(8.0),
// //           //   decoration: BoxDecoration(
// //           //     borderRadius: BorderRadius.circular(10.0),
// //           //     image: DecorationImage(
// //           //       image: NetworkImage("https://img.freepik.com/free-photo/natures-beauty-reflected-tranquil-mountain-waters-generative-ai_188544-7867.jpg"),
// //           //       fit: BoxFit.cover,
// //           //     ),
// //           //   ),
// //           // ),
// //           // Container(
// //           //   margin: EdgeInsets.all(8.0),
// //           //   decoration: BoxDecoration(
// //           //     borderRadius: BorderRadius.circular(10.0),
// //           //     image: DecorationImage(
// //           //       image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJaGJkBMUC8PLCCOZ0prsrw8G24kIgtlgENosvHw3PJcltgjhtypEzkC0xzQuqGClM28I&usqp=CAU"),
// //           //       fit: BoxFit.cover,
// //           //     ),
// //           //   ),
// //           // ),
// //         ],
// //         options: CarouselOptions(
// //           height: 240,
// //           enlargeCenterPage: true,
// //           autoPlay: true,
// //           aspectRatio: 16 / 9,
// //           autoPlayCurve: Curves.fastOutSlowIn,
// //           enableInfiniteScroll: true,
// //           autoPlayAnimationDuration: Duration(milliseconds: 800),
// //           viewportFraction: 0.8,
// //         ),
// //       ),
// //     );
// //   }
// // }