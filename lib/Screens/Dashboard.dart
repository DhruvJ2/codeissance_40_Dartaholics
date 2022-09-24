import 'dart:math';

import 'package:dartaholics/custom_navigation_bar/drawer_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:dartaholics/models/news_data.dart';

import '../models/news_data.dart';
import '../services/auth.dart';
import '../services/tech_news_service.dart';

class Board extends StatefulWidget {
  final VoidCallback? openDrawer;

  const Board({super.key, this.openDrawer});
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height * 1.5,
          width: size.width,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  AppBar(
                    actions: [
                      IconButton(
                        onPressed: () async {
                          await auth.signOut();
                        },
                        icon: Icon(Icons.logout),
                      )
                    ],
                    leading: DrawerMenuWidget(onClicked: widget.openDrawer),
                    toolbarHeight: 300,
                    elevation: 50,
                    shadowColor: Colors.white30,
                    backgroundColor: Color.fromRGBO(223, 211, 255, .6),
                    flexibleSpace: ClipPath(
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF651FFF),
                              Color(0xFF5E35B1),
                              Color(0xFF7E57C2),
                              Color(0xFF9575CD),
                            ],
                          ),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Find Designs Events',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '124 Events in your town',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                              // textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                ),
                                hintText: 'Search Here...',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    right: 25,
                    top: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 10,
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'You have 2 events',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'this week',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Container(
                                  width: 100,
                                  height: 80,
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurpleAccent,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Check Status',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: DrawerMenuWidget(onClicked: widget.openDrawer),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(223, 211, 255, .6),
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Recommended Events',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.3,
                      width: size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 03,
                          itemBuilder: (context, index) {
                            return Container(
                                child: MyWidget(
                                    choice1: _itemsComponent1()[index]));
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Latest Tech Updates',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/event-description');
                      },

                      
                      child: Container(
                        height: size.height * 0.6,
                        width: size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 05,
                            itemBuilder: (context, index) {
                              return Container(
                                child: MyList(choice: _itemsComponent()[index]),
                              );
                            }),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice(
      {required this.title, required this.image, required this.subtitle});
  final String title;
  final String subtitle;

  final ImageProvider image;
}

List<Choice> _itemsComponent() {
  const List<Choice> choices = <Choice>[
    Choice(
        title: 'Tesla News',
        image: AssetImage('assets/images/tesla.jfif'),
        subtitle:
            'Tesla recalls nearly 1.1 million US vehicles \n to update window reversing software'),
    Choice(
        title: 'Latest Cryptocurrency News',
        image: AssetImage('assets/images/crypt.png'),
        subtitle:
            'Market Steadies After Fed Rate \n Hike; BTC Up 0.91%, XRP Soars 5%'),
    Choice(
        title: 'Fraud Alert',
        image: AssetImage('assets/images/trojan.jfif'),
        subtitle: 'Bank Customers Targeted by \n SOVA Android Trojan'),
    Choice(
        title: 'RealMe Watch3 Rro',
        image: AssetImage('assets/images/realme.jpg'),
        subtitle: 'Feature-packed smartwatch \n under Rs 5,000'),
    Choice(
        title: 'Cryptocurrency',
        image: AssetImage('assets/images/feed3.jfif'),
        subtitle: 'Will Feed3 Replace Ethereum \nAs The BIggest Altcoin '),
  ];
  return choices;
}

class MyList extends StatelessWidget {
  MyList({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  List<Article> articles = <Article>[];

  @override
  Widget build(BuildContext context) {
    var size2 = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.centerLeft,
          width: size2.width * 0.9,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: choice.image,
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Container(
            width: size2.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 180,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        choice.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          choice.subtitle,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice1 {
  const Choice1(
      {required this.title,
      required this.image,
      required this.location,
      required this.time});
  final String title;
  final String location;
  final String time;

  final ImageProvider image;
}

List<Choice1> _itemsComponent1() {
  const List<Choice1> choices = <Choice1>[
    Choice1(
        title: 'The Remote Design',
        image: AssetImage('assets/images/meetuptalk.jpg'),
        location: 'The Concert Hall',
        time: '14:30'),
    Choice1(
        title: 'UI/UX Development',
        image: AssetImage('assets/images/seddesh.jpg'),
        location: 'University',
        time: '18:30'),
    Choice1(
        title: 'Developers Club',
        image: AssetImage('assets/images/develop.png'),
        location: 'Online',
        time: '10:30'),
  ];
  return choices;
}

class MyWidget extends StatelessWidget {
  MyWidget({Key? key, required this.choice1}) : super(key: key);
  final Choice1 choice1;

  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Container(
          alignment: Alignment.centerLeft,
          width: size1.width * 0.65,
          height: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: SizedBox(
                      height: size1.height * 0.13,
                      width: size1.width * 0.65,
                      child: Image(
                        fit: BoxFit.cover,
                        image: choice1.image,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0, top: 8.0),
                    alignment: Alignment.topLeft,
                    child: Text(choice1.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(choice1.location,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.access_alarm,
                          color: Colors.black,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(choice1.time,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 75,
                left: 175,
                child: Container(
                  alignment: Alignment.center,
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: Text(
                        '22',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'Feb',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
