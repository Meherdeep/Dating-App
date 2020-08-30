import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dating_app/helper/style.dart';
import '../data/profile_pic.dart';

class YourInfo extends StatefulWidget {
  final Function onAddButtonTapped;
  YourInfo(this.onAddButtonTapped);
  @override
  _YourInfoState createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool isImageSelected = false;
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
              height: MediaQuery.of(context).size.height*0.08,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: Center(
                child: FlatButton(
                  onPressed: loadImageFromGallery, 
                  child: isImageSelected? Image.file(_imageFile): Image.asset('assets/default_profile_pic.jpg'),
                )
              ),
            ),
            Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
            width: MediaQuery.of(context).size.width*0.3,
            color: Color(0xFFEF959F),
            child: MaterialButton(
            onPressed: (){
              widget.onAddButtonTapped(2);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Next', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt, 
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
          ),
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
      profilePic = image.path;
      isImageSelected = true;
    });
  }
}