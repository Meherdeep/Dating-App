import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dating_app/data/gender.dart';
import 'package:dating_app/data/selected_partner.dart';
import 'package:dating_app/helper/style.dart';
import 'package:dating_app/pages/messaging.dart';
import 'package:dating_app/pages/profile.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class MatchesWindow extends StatefulWidget {
  @override
  _MatchesWindowState createState() => _MatchesWindowState();
}

class _MatchesWindowState extends State<MatchesWindow> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<String> femaleName = ['Shrishti', 'Shriya','Christine', 'Alia', 'Elizabeth','Selena'];
  List<String> maleName = ['Zayn Malik', 'T\'Challa','Rohan','Mark', 'Elliot', 'Meher'];
  Random random = Random();

  @override
  void dispose() { 
    selectedPartner.clear();
    super.dispose();
  }

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
              child: Text('Inbox', style: signUpHeaderTextStyle.copyWith(color: Colors.white, fontSize: 40) ,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: selectedPartner.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: ExactAssetImage(selectedPartner[index]),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20)
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    gender == 'Male'
                                      ? Text(
                                          femaleName[random.nextInt(6)], 
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ) 
                                      : Text(
                                          maleName[random.nextInt(6)],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                    Text(
                                      'Lorem ipsum dolor sit amet',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                    onTap: (){
                      if (gender == 'Male') {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => MessagingWindow(femaleName[random.nextInt(6)]))
                        );
                      } else {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => MessagingWindow(maleName[random.nextInt(6)]))
                        );
                      }
                    },
                  );
                }
              ),
            )
          ],
        ) 
      ),
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