import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Call%20Screen/call_screen.dart';
import 'package:jamesbondi/components/JoinChannel.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  final String meetID;
  final bool lecturer;
  Body(this.meetID, this.lecturer);
  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  /// if channel textField is validated to have error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultations'),
        backgroundColor: customPurple,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text('Channel ID: ' + widget.meetID))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: onJoin,
                        child: Text('Join'),
                        color: customPurple,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // await for camera and mic permissions before pushing video page
    await JoinChannel.handleCameraAndMic(Permission.camera);
    await JoinChannel.handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: widget.meetID,
          role: ClientRole.Broadcaster,
        ),
      ),
    );
  }
}
