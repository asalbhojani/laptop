import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/main.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  var searchName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        flexibleSpace: Padding(
          padding: EdgeInsets.only( left:10,right:10,top: 5),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                searchName = value;
              });
            },
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xf0000000)),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Color(0xf0000000)),
              contentPadding: EdgeInsets.only(left: 20, top: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xf0003333)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xf0003333)),
              ),
              suffixIcon: IconButton(
                onPressed: () {
// perform search
                },
                icon: Icon(
                  Icons.search,
                  color: Color(0xf0000000),
                ),
              ),
            ),
            cursorColor: Color(0xf0000000),
          ),
        ),

        centerTitle: true,
        elevation: 0,
        leading: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation()));
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xf0000000),
              ));
        }),
// dehaze
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: EdgeInsets.only(top: 20,bottom: 10,left: 20),
                child: Text("Top Searches",style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),),
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Product-Data')
                      .orderBy('Product-Brand')
                      .startAt([searchName.toUpperCase()]).endAt([searchName.toUpperCase() + "\uf8ff"]).snapshots(),
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
            ],
          ),
        ),
      ),
    );
  }
}

//
// appBar: AppBar(
//
// backgroundColor: Color(0xffffffff),
// flexibleSpace: Padding(
// padding: EdgeInsets.only(right: 8.0,left: 250,top: 5),
// child: TextField(
// onChanged: (value) {
// setState(() {
// searchName = value;
// });
// },
// style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xf0000000)),
// decoration: InputDecoration(
// // hintText: 'Search',
// // hintStyle: TextStyle(color: Color(0xf0000000)),
// contentPadding: EdgeInsets.only(left: 20,top: 20),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(25.0),
// borderSide: BorderSide(color: Colors.white),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(25.0),
// borderSide: BorderSide(color: Color(0xf0003333)),
// ),
// suffixIcon: IconButton(
// onPressed: () {
// // perform search
// },
// icon: Icon(Icons.search, color: Color(0xf0000000),),
// ),
// ),
// cursorColor: Color(0xf0000000),
// ),
// ),
//
// // dehaze
//
// // actions: [
// // Container(
// //   width: 200,
// //   decoration: BoxDecoration(
// //       // border: Border.all(width: 2, color: selectedIndex == index ?Color(0xf0008080):
// //       // Color(0xffffffff),),
// //   ),
// //   child: TextFormField(
// //     controller: userSearch,
// //     decoration: InputDecoration(
// //         hintText: "Search"
// //     ),
// //   ),
// // ),
// // IconButton(onPressed: (){
// //   setState(() {
// //     searchValue = userSearch.text.toString();
// //     print(searchValue);
// //   });
// // }, icon: Icon(Icons.search,color: Color(0xf0000000),)),
//
// // SizedBox(height: 20,),
//
// // ],
//
// centerTitle: true,
// elevation: 0,
// leading: Builder(builder: (context){
// return IconButton(onPressed: (){
// Scaffold.of(context).openDrawer();
// }, icon: Icon(Icons.dehaze,color: Color(0xf0000000),));
// }),
// // dehaze
// ),

// appBar: AppBar(
//   backgroundColor: Color(0xffffffff),
//   title: SizedBox(
//     height: 40,
//     child: TextField(
//       onChanged: (value) {
//         setState(() {
//           searchName = value;
//         });
//       },
//       decoration: InputDecoration(
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none),
//           contentPadding:
//           EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//           filled: true,
//           fillColor: Color.fromARGB(255, 39, 39, 39),
//           hintText: 'Search',
//           hintStyle: TextStyle(color: Colors.grey),
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.grey,
//           )),
//     ),
//   ),
// ),
