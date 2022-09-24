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
                      fontWeight: FontWeight.bold))
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
            child: Lottie.asset("assets/jsons/meet.json", width: 200),
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
        color: Color.fromARGB(255, 238, 231, 231),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 52),
            child: Lottie.asset("assets/jsons/meet.json", width: 200),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up Today",
                  style: TextStyle(color: Colors.blue, fontSize: 25)),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50, right: 50, bottom: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "To ",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    Lottie.asset("assets/jsons/rocket.json",
                        repeat: true, width: 90, height: 90),
                    Text(
                      " your career",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/welcome");
                  },
                  child: const Text(
                    "Dive In",
                    style: TextStyle(color: Colors.lightBlue),
                  ))
            ],
          )
        ]),
      ),
    ];
  }
}
