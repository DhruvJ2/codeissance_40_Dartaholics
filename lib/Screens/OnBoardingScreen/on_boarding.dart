import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoaringState();
}

class _OnBoaringState extends State<OnBoarding> {
  bool _enableSlideIcon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: _getPages(),
        onPageChangeCallback: ((activePageIndex) {
          setState(() {
            _enableSlideIcon = activePageIndex != 2;
          });
        }),
        positionSlideIcon: 0.5,
        waveType: WaveType.liquidReveal,
        enableLoop: false,
        enableSideReveal: true,
        fullTransitionValue: 300,
        ignoreUserGestureWhileAnimating: true,
        slideIconWidget: _enableSlideIcon
            ? const Icon(
                Icons.arrow_back_ios,
              )
            : null,
      ),
    );
  }

  List<Widget> _getPages() {
    return [
      Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 52),
            child: Lottie.asset("assets/jsons/meet.json", width: 200),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Find", style: TextStyle(color: Colors.black, fontSize: 25)),
              Text("Inspiration",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 8, 166),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monument'))
            ],
          )
        ]),
      ),
      Container(
        width: double.infinity,
        color: Colors.blue[700],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 52),
            child: Lottie.asset("assets/jsons/meet_3.json", width: 200),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Attend Meetups.",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              Text("Share your Ideas.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w500)),
              Text("Grow your career.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold))
            ],
          )
        ]),
      ),
      Container(
        width: double.infinity,
        color: Color(0xf9f9f9),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("assets/jsons/meet.json", width: 250, height: 250),
          const Image(
            image: AssetImage("assets/images/talk_up.png"),
            width: 180,
            height: 180,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(color: Color(0xf9f9f9)),
              // ignore: sort_child_properties_last
              child: Center(
                  child: AnimatedTextKit(
                animatedTexts: [
                  // ignore: prefer_const_constructors
                  FadeAnimatedText(
                    "Attend",
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  FadeAnimatedText(
                    "Engage",
                    textStyle: TextStyle(fontSize: 30),
                  ),
                  FadeAnimatedText("UpSkill",
                      textStyle: TextStyle(fontSize: 30)),
                  FadeAnimatedText("Grow", textStyle: TextStyle(fontSize: 30))
                ],
              )),
              width: double.infinity,
              height: 200,
            ),
          )
        ]),
      ),
    ];
  }
}
