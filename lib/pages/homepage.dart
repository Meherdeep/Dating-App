import 'package:dating_app/data/gender.dart';
import 'package:dating_app/helper/profile_class.dart';
import 'package:dating_app/helper/style.dart';
import 'package:dating_app/pages/match_window.dart';
import 'package:dating_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tinder_card/cards.dart';
import 'package:tinder_card/tinder_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;

  final List<Profile> maleProfiles = [ 
    Profile(
      photos: [
        'assets/male/1.jpg',
        'assets/male/2.jpg',
        'assets/male/3.jpg'
      ],
      name: 'Elliot',
      bio: 'Cyber Security in by day, vigilante hacker by night'
    ),
    Profile(
      photos: [
        'assets/male/4.jpg',
        'assets/male/5.jpg',
        'assets/male/6.jpg'
      ],
      name: 'Zayn Malik',
      bio: 'You already know me.'
    ),
    Profile(
      photos: [
        'assets/male/7.jpg',
        'assets/male/8.jpg'
      ],
      name: 'Li Jun',
      bio: 'Chilling.'
    ),
    Profile(
      photos: [
        'assets/male/9.jpg',
        'assets/male/10.jpg'
      ],
      name: 'T\'Challa',
      bio: 'Wakanda Forever.'
    )
  ];

  final List<Profile> femaleProfiles = [
    Profile(
      photos: [
        'assets/female/1.jpg',
        'assets/female/2.jpg',
        'assets/female/3.jpg'
      ],
      name: 'Shrishti',
      bio: 'Shopaholic'
    ),
    Profile(
      photos: [
        'assets/female/4.jpg',
        'assets/female/5.jpg'
      ],
      name: 'Alia',
      bio: 'Hit me up before the market opens'
    ),
    Profile(
      photos: [
        'assets/female/6.jpg'
      ],
      name: 'Shuri',
      bio: 'Run away.'
    ),
    Profile(
      photos: [
        'assets/female/7.jpg',
        'assets/female/8.jpg'
      ],
      name: 'Christine',
      bio: 'Will you run away with me?'
    ),
    Profile(
      photos: [
        'assets/female/9.jpg',
        'assets/female/10.jpg',
        'assets/female/11.jpg'
      ],
      name: 'Selena Gomez',
      bio: 'Ice Cream'
    )
  ];

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
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*0.8,
              child: TinderSwapCard(
                demoProfiles: gender == 'Male' ? femaleProfiles: maleProfiles,
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