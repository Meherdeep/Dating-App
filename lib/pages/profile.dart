import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dating_app/data/bio.dart';
import 'package:dating_app/data/profile_pic.dart';
import 'package:dating_app/helper/style.dart';
import 'package:dating_app/pages/homepage.dart';
import 'package:dating_app/pages/match_window.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  
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
              child: Text('Profile', style: signUpHeaderTextStyle.copyWith(color: Colors.white, fontSize: 40) ,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(profilePic)),
                //child: Image.file(File(profilePic), fit: BoxFit.contain,),
              )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Center(
              child: Text(userName, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Text(bioText, style: TextStyle(color: Colors.white, fontSize: 20 ),),
                    ),
              )
            )
          ],
        ) 
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
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