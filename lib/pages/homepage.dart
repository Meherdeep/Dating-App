import 'package:dating_app/data/gender.dart';
import 'package:dating_app/helper/profile_class.dart';
import 'package:dating_app/helper/style.dart';
import 'package:dating_app/pages/match_window.dart';
import 'package:dating_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tcard/tcard.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  static List<String> maleImages = [
        'assets/male/1.jpg',
        'assets/male/2.jpg',
        'assets/male/3.jpg',
        'assets/male/4.jpg',
        'assets/male/5.jpg',
        'assets/male/6.jpg',
        'assets/male/7.jpg',
        'assets/male/8.jpg',
        'assets/male/9.jpg',
        'assets/male/10.jpg'
  ];

  static List<String> femaleImages = [
    'assets/female/1.jpg',
    'assets/female/2.jpg',
    'assets/female/3.jpg',
    'assets/female/4.jpg',
    'assets/female/5.jpg',
    'assets/female/6.jpg',
    'assets/female/7.jpg',
    'assets/female/8.jpg',
    'assets/female/9.jpg',
    'assets/female/10.jpg',
    'assets/female/11.jpg'
  ];
  
  List<Widget> cards = List.generate(
    gender == 'Male'? femaleImages.length : maleImages.length,
    (int index) {
      return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23.0,
            spreadRadius: -13.0,
            color: Colors.black54,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: gender == 'Male'
                ? Image.asset(femaleImages[index])
                : Image.asset(maleImages[index]),
      )
      );
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDBD6),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Discover', style: signUpHeaderTextStyle.copyWith(color: Colors.white, fontSize: 40) ,),
            ),
            Expanded(
                          child: TCard(
                cards: cards,
                size: Size(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width*0.8)
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.person, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.message_rounded, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            switch (index) {
              case 0:
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>UserProfile())
                );
                break;
              
              case 1:
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>HomePage())
                );
                break;
              
              case 2:
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>MatchesWindow())
                );
                break;
              
              default:
            }
          });
        },
        ),
    );
  }
  
}