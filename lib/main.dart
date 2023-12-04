import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptop/HP.dart';
import 'package:laptop/Home.dart';
import 'package:laptop/Login_Screen.dart';
import 'package:laptop/Search.dart';
import 'package:laptop/home/ProductsList.dart';
import 'package:laptop/rating.dart';
import 'package:laptop/search_view.dart';
import 'package:laptop/test.dart';
import 'firebase_options.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {

  int selectedIndex=0;
  void pageShifter(index){
    setState(() {
      selectedIndex=index;
    });
  }

  List<Widget> myScreens=[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:myScreens[selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          backgroundColor: Color(0xffffffff),
          color: Color(0xf0002525),
          onTap: pageShifter,
          items: [
            Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
            Color(0xf0a9a9a9),),
            Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
            Color(0xffff4914),),
            Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
            Color(0xffff4914),),
            Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
            Color(0xffff4914),)
          ])


    );
  }
}



