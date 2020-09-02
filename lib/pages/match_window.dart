import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dating_app/pages/profile.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class MatchesWindow extends StatefulWidget {
  @override
  _MatchesWindowState createState() => _MatchesWindowState();
}

class _MatchesWindowState extends State<MatchesWindow> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDBD6),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
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