import 'package:dating_app/helper/style.dart';
import 'package:flutter/material.dart';


class YourBio extends StatefulWidget {
  final Function onAddButtonTapped;
  YourBio(this.onAddButtonTapped);
  @override
  _YourBioState createState() => _YourBioState();
}

class _YourBioState extends State<YourBio> {
  TextEditingController _bio = TextEditingController();
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
                  Text('03', style: signUpHeaderTextStyle.copyWith(fontSize: 40),),
                  Text('Your profile', style: signUpHeaderTextStyle.copyWith(fontSize: 25)),
                  SizedBox(height: 20),
                  
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Add your bio', style: dilutedText), 
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Center(
              child: Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width*0.8,
              child: TextField(
                controller: _bio,
                minLines: 10,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: 'Add your bio here...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    )
                  )
                ),
              ),
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
}