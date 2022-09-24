// ignore_for_file: avoid_unnecessary_containers

import 'package:dartaholics/custom_navigation_bar/drawer_menu_widget.dart';
import 'package:dartaholics/custom_navigation_bar/mydrawer.dart';
import 'package:flutter/material.dart';

import '../models/news_data.dart';
import '../services/auth.dart';
import '../services/tech_news_service.dart';

class Board extends StatefulWidget {
  final VoidCallback? openDrawer;
  const Board({Key? key, this.openDrawer}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool _loading = false;

    List<Article> articles = <Article>[];

    getNews() async {
      News newsClass = News();
      await newsClass.getNews();
      articles = newsClass.articles;
      setState(() {
        _loading = false;
      });
    }

    @override
    void initState() {
      super.initState();
      getNews();
    }

    return Scaffold(
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
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
                    backgroundColor: const Color.fromRGBO(223, 211, 255, .6),
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
                          child: const Text(
                            'Find Designs Events',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '124 Events in your town',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              // textAlign: TextAlign.left,
                              decoration: const InputDecoration(
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
                        decoration: const BoxDecoration(
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
                                children: const [
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
                                      child: const Text(
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
                  )
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
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Recommended Events',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 03,
                          itemBuilder: (context, index) {
                            return Container(child: const MyWidget());
                          }),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Latest Tech Updates',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.6,
                      width: size.width,
                      child: _loading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: MyList(index),
                                );
                              }),
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

class MyList extends StatefulWidget {
  final int index;
  const MyList(this.index, {super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/meetuptalk.jpg'),
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
                stops: const [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[widget.index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          articles[widget.index].description,
                          style: const TextStyle(
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Container(
          alignment: Alignment.centerLeft,
          width: size1.width * 0.65,
          height: 150,
          decoration: const BoxDecoration(
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
                    child: Image(
                      height: 100,
                      width: size1.width,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/meetuptalk.jpg'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0, top: 8.0),
                    alignment: Alignment.topLeft,
                    child: const Text('Remote Design Week',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text('The Concert Hall',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.access_alarm,
                          color: Colors.black,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text('06:30',
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
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: const Text(
                        '22',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    const Text(
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
    return false;
  }
}
