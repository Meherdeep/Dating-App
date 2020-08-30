import 'dart:async';

import 'package:dating_app/helper/style.dart';
import 'package:dating_app/pages/homepage.dart';
import 'package:flutter/material.dart';

class YourMatch extends StatefulWidget {
  @override
  _YourMatchState createState() => _YourMatchState();
}

class _YourMatchState extends State<YourMatch> {
  
  @override
  void initState() { 
    super.initState();
    Timer(
      Duration(seconds: 5), 
      (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (_)=>HomePage())
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('04', style: signUpHeaderTextStyle.copyWith(fontSize: 40),),
                  Text('Your Match', style: signUpHeaderTextStyle.copyWith(fontSize: 25)),
                  SizedBox(height: 20),
                  
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Looking for your match', style: dilutedText), 
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height*0.1,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/couple.jpg',
                fit: BoxFit.fill,
              ),
            )
            
         ]
        ),  
      ),
      
    );
  }
}