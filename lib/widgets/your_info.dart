import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dating_app/helper/style.dart';

class YourInfo extends StatefulWidget {
  @override
  _YourInfoState createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
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
                  Text('02', style: signUpHeaderTextStyle.copyWith(fontSize: 40),),
                  Text('Your profile', style: signUpHeaderTextStyle.copyWith(fontSize: 25)),
                  SizedBox(height: 20),
                  
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Add your image', style: dilutedText), 
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Center(
              child: FlatButton(
                onPressed: loadImageFromGallery, 
                child: Image.asset('assets/default_profile_pic.jpg'),
              )
            )

         ]
        ),  
      ),
      
    );
  }

  void loadImageFromGallery() async{
    var image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image.path);
    });
  }
}