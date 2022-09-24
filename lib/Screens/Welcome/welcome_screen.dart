import 'package:dartaholics/Screens/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import '../signup_screen.dart';
import 'widgets/social_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Board();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went Wrong'),
                );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(223, 211, 255, 1),
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.350,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background.png'),
                                  fit: BoxFit.fill)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  left: 35,
                                  width: 75,
                                  height: 175,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-1.png'))),
                                  )),
                              Positioned(
                                  left: 130,
                                  width: 85,
                                  height: 130,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-2.png'))),
                                  )),
                              Positioned(
                                  right: 40,
                                  top: 5,
                                  width: 85,
                                  height: 150,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/clock.png'))),
                                  )),
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sourceSansPro'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(43, 10, 43, 28),
                          child: Text(
                              "Keep yourself updated with your latest trends",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2.0,
                                  fontFamily: 'sourceSansPro')),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Container(
                              height: size.height * 0.075,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(133, 148, 251, 1),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sourceSansPro',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        signInWithText(),
                        socialBtnRow(context),
                        SizedBox(
                          height: size.height * 0.003,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(
                                    color: Color.fromRGBO(133, 148, 251, 1),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
