import 'package:dating_app/widgets/your_bio.dart';
import 'package:dating_app/widgets/your_details.dart';
import 'package:dating_app/widgets/your_info.dart';
import 'package:dating_app/widgets/your_match.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  PageController _pageController;
  @override
  void initState() { 
    super.initState();
    _pageController = PageController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          YourDetails(onAddButtonTapped),
          YourInfo(onAddButtonTapped),
          YourBio(onAddButtonTapped),
          YourMatch()
        ],
      ),
      
    );
  }
  void onAddButtonTapped(int index) {

  // use this to animate to the page
  _pageController.animateToPage(
    index,
    duration: Duration(milliseconds: 150), 
    curve: Curves.decelerate
  );
}
}