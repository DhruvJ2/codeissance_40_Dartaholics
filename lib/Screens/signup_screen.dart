import 'package:dartaholics/Screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class SignUp extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final AuthServices auth = AuthServices();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  var error = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
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
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 100,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/dark2.png'))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 150, left: 20, right: 20, bottom: 0.0),
                  height: 500,
                  child: Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .5),
                                blurRadius: 30.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Card(
                        elevation: 50,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: const Text(
                                  "Register",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        controller: _email,
                                        validator: (value) => value!.isEmpty
                                            ? "Username cannot be empty"
                                            : null,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email or Phone number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _password,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Password cannot be empty";
                                          } else if (value.length < 6) {
                                            return "Enter at least 6 character";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: _username,
                                        validator: ((value) => value == ""
                                            ? "Please Enter valid Username"
                                            : null),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Username",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      final result = await auth
                                          .registerWithEmailAndPassword(
                                              _email.text,
                                              _password.text,
                                              _username.text);
                                      if (result == null) {
                                        error = "Invalid Credentials";
                                      }
                                      Navigator.of(context)
                                          .pushReplacementNamed('/');
                                    }
                                  },
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/login');
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
                                          color:
                                              Color.fromRGBO(133, 148, 251, 1),
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
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  width: 80,
                  height: 200,
                  child: Container(
                    // margin: EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/dark.png'))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
