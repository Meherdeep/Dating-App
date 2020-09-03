import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class CallFunctions extends StatefulWidget {
  @override
  _CallFunctionsState createState() => _CallFunctionsState();
}

class _CallFunctionsState extends State<CallFunctions> {
  bool micStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
                      child: IconButton(
              icon: micStatus ? Icon(Icons.mic_off, color: Colors.red,) : Icon(Icons.mic, color: Colors.green) , 
              onPressed: toggleMute,
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(Icons.call_end, color: Colors.white,), 
              onPressed: disconnectCall,
            )
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: IconButton(
              icon: Icon(Icons.switch_camera, color: Colors.blue,), 
              onPressed: toggleCamera,

            )
          ),
        ],
      ),
      
    );
  }
  void toggleMute(){
    setState(() {
      micStatus = !micStatus;
    });
    AgoraRtcEngine.muteLocalAudioStream(micStatus);
  }
  void toggleCamera(){
    AgoraRtcEngine.switchCamera();
  }
  void disconnectCall(){
    Navigator.pop(context);
  }
}