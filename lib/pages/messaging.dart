import 'package:dating_app/data/bio.dart';
import 'package:dating_app/widgets/rtm.dart';
import 'package:flutter/material.dart';

class MessagingWindow extends StatefulWidget {
  final String userName;
  MessagingWindow(this.userName);
  @override
  _MessagingWindowState createState() => _MessagingWindowState();
}

class _MessagingWindowState extends State<MessagingWindow> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDBD6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.videocam, 
              color: Colors.white
            ), 
            onPressed: null
          )
        ],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.userName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RealTimeMessaging('${widget.userName}$userName', userName)
        ),
      ),
    );
  }
}