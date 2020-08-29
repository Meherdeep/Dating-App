import 'package:dating_app/widgets/your_details.dart';
import 'package:dating_app/widgets/your_info.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          YourDetails(),
          YourInfo(),
        ],
      ),
      
    );
  }
}