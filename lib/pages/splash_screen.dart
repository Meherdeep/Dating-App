import 'package:dating_app/pages/homepage.dart';
import 'package:dating_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>SignUp())
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.gif', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Lorem Ipsum',
          body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          image: _buildImage('1'),
          decoration: pageDecoration
        ),
        PageViewModel(
          title: 'Lorem Ipsum',
          body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          image: _buildImage('2'),
          decoration: pageDecoration
        ),
        PageViewModel(
          title: 'Lorem Ipsum',
          body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          image: _buildImage('3'),
          decoration: pageDecoration
        ),
      ],
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)), 
      onDone: ()=>_onIntroEnd(context),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ), 
    );
  }
}