import 'package:flutter/material.dart';

import 'Login.dart';

class SignUp extends StatelessWidget {
  var _sizee;
  Color mainColor = Color(0xdf91fe);
  @override
  Widget build(BuildContext context) {
    _sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          height: _sizee.height,
          width: _sizee.width,
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

                  decoration: BoxDecoration(
                      image: DecorationImage(

                          image: AssetImage('assets/images/dark2.png')
                      )
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 150,left: 20,right: 20,bottom: 0.0),
                height: 470,
                child: Positioned(

                  child: Container(

                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .5),
                              blurRadius: 30.0,
                              offset: Offset(0, 10)
                          )
                        ]
                    ),
                    child: Card(
                      elevation: 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5,20,0.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 50),
                                child: Text("Register",
                                  textAlign:TextAlign.start,
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10)
                                    )
                                  ]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email or Phone number",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey))
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Phone Number",
                                          hintStyle: TextStyle(color: Colors.grey[400])
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 148, 251, 1),
                                          Color.fromRGBO(143, 148, 251, .6),
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: Text("SignUp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                                )),

                            SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Login()),
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
                                        color:Color.fromRGBO(133, 148, 251, 1),
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/dark.png')
                      )
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 650,left: 80,right: 80),

                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,

                  ),

                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(10),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          child: Image(image: AssetImage(
                              'assets/images/google.png'),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sign In With Google',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),




    );
  }
}