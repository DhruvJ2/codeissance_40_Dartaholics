import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
      backgroundColor: const Color.fromARGB(255, 223, 222, 241),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Audio',
            style: TextStyle(
              color: Color.fromARGB(255, 9, 87, 164),
              letterSpacing: 2.0,
              wordSpacing: 2.0,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 9, 87, 164),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: AnimationLimiter(
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 1),
              child: const SlideAnimation(
                verticalOffset: 44.0,
                child: FadeInAnimation(
                  child: Text(
                    'Dummy Text',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(seconds: 1),
              child: SlideAnimation(
                verticalOffset: 44.0,
                child: FadeInAnimation(
                  child: CustomCard(index),
                ),
              ),
            );
          },
        ),
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
