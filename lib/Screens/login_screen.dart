import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Color mainColor = Color(0xdf91fe);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 380,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-2.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 30,
                      width: 80,
                      height: 150,
                      child:Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 180,
                      
                      child: Container(
                    
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 280,left: 20,right: 20,bottom: 0.0),
                height: 330,
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
                        padding: const EdgeInsets.fromLTRB(20, 50,20,0.0),
                        child: Column(
                          children: <Widget>[
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
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
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
                                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                                )),

                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Text("Forgot Password", style: TextStyle(color:  Color.fromRGBO(143, 148, 251, 1), fontWeight: FontWeight.bold),),
                            )


                          ],
                        ),
                      ),


                    ),
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