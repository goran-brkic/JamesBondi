import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class CallPage extends StatelessWidget {
  ClientRole role;
  String channelName;

  CallPage({this.channelName, this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        channelName: channelName,
        role: role,
      ),
    );
  }
}
