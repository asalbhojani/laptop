import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
                  Container(
                    width: double.infinity,
                      height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/slim.png'),
                      )
                    ),
                  ),
            Stack(
              children:[ Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  color: Color.fromRGBO(6, 27, 28,1)
                ),
              ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 70,
                      margin: EdgeInsets.only(left: 30 ,top: 30),
                      child: Text("Laptop Name", style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ), ),
                    ),
                    SizedBox(width: 40,),
                    
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(6, 27, 28, 1),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.white, size: 40,),
                          Container(
                            decoration: BoxDecoration(
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30 ,top: 80),
                      width: 300,
                      height: 70,
                      child: Text("Price: 55,0000 PKR" , style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ), ),
                    )
                  ],
                ),
              Row(
                  children: [
                    Container(
                      height: 70,
                      width: 30,
                      margin: EdgeInsets.only(top: 200),
                    ),
                   const Icon(Icons.star, color: Colors.yellow, size: 30,),
                    const Icon(Icons.star, color: Colors.yellow, size: 30,),
                    const Icon(Icons.star, color: Colors.yellow, size: 30,),
                    const Icon(Icons.star, color: Colors.yellow, size: 30,),
                    const Icon(Icons.star, color: Colors.yellow, size: 30,),

                    SizedBox(width: 140,),

                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(6, 27, 28, 1),
                      child: Row(
                        children: [
                          Icon(Icons.reviews, color: Colors.white, size: 40,),
                          Container(
                            decoration: BoxDecoration(
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 170 , left: 20),
                      child: Text("------------------------------------" ,style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220 , left: 20),
                      child: Text("Specification: ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 280 , left: 20),
                      child: Text("01: Operating System: Window 10 Pro ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 300 , left: 20),
                      child: Text("02: Memory: 8GB Ram LPDDR5 on board ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 320 , left: 20),
                      child: Text("03: Storage: 512GB  ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 340 , left: 20),
                      child: Text("04: processor: IntelA@ Coreac i9-12900H processor 2.5 GHZ ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 360, left: 20),
                      child: Text("05: Display: 16.0 inch 4k oled 16:10 aspect ratio ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 380, left: 20),
                      child: Text("06: Power: 6.0, 200w, AC Adapter, output: 20v DC, 10A ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 400 , left: 20),
                      child: Text("07: battery: 96WHrs, 3S2P, 6 CELL ",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    )
                  ],
                ),

                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 440 , left: 70),
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.only(left: 40, top: 8),
                        child: Text("Add To Card" ,style: GoogleFonts.poppins(
                          color: Color.fromRGBO(6, 27, 28, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    )
                  ],
                )
        ]
            ),
          ],
        ),

      ),

    );
  }
}
