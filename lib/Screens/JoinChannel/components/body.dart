import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Call%20Screen/call_screen.dart';
import 'package:jamesbondi/components/JoinChannel.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  /// create a channelController to retrieve text value
  TextEditingController _channelController;

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konzultacije'),
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
                  Expanded(
                      child: TextField(
                    enabled: false,
                    controller: _channelController,
                    decoration: InputDecoration(
                        errorText:
                            _validateError ? 'Channel name is mandatory' : null,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: customPurple),
                        ),
                        hintText: 'Channel name',
                        fillColor: customPurple),
                  ))
                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Predavac'),
                    leading: Radio(
                      activeColor: customPurple,
                      value: ClientRole.Broadcaster,
                      groupValue: _role,
                      onChanged: (ClientRole value) {
                        setState(() {
                          _role = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Student'),
                    leading: Radio(
                      value: ClientRole.Audience,
                      groupValue: _role,
                      onChanged: (ClientRole value) {
                        setState(() {
                          _role = value;
                        });
                      },
                    ),
                  )
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
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await JoinChannel.handleCameraAndMic(Permission.camera);
      await JoinChannel.handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }
}
