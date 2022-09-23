import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../../services/webrtc.dart';
import 'widgets/custom_card.dart';

class VoiceCall extends StatefulWidget {
  const VoiceCall({super.key});

  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _localRenderer.initialize();
    _remoteRenderer.initialize();
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return Text('Dummy Text',textAlign: TextAlign.center,);
        }, itemBuilder: (BuildContext context, int index) { return CustomCard(); },
      ),
      // roomId = await signaling.createRoom(_remoteRenderer);
      // textEditingController.text = roomId!;
      // setState(() {});

      // Add roomId
      // signaling.joinRoom(
      //   textEditingController.text,
      //   _remoteRenderer,
      // );

      // Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
      // Expanded(child: RTCVideoView(_remoteRenderer)),
    );
  }
}
