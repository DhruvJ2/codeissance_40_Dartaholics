import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final _imageurl =
      "https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image.jpeg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 227, 223, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                
                decoration: const BoxDecoration(color:Color.fromARGB(255, 164, 27, 210),),
                margin: EdgeInsets.zero,
                accountName: const Text("Siddesh Shetty"),
                accountEmail: const Text("siddushetty30@gmail.com"),
                currentAccountPicture: CircleAvatar(
                 
                  backgroundImage: NetworkImage(_imageurl),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.houseChimney,
                color: Color.fromARGB(255, 164, 27, 210),
              ),
              title: GestureDetector(
                onTap: () {Navigator.of(context).pushReplacementNamed('/home');},
                child:const  Text(
                  "Home",
                  style: TextStyle(color: Color.fromARGB(255, 164, 27, 210)),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.user,
                color: Color.fromARGB(255, 164, 27, 210),
              ),
              title: GestureDetector(
                onTap: () {Navigator.of(context).pushReplacementNamed('/');},
                child:const  Text(
                  "Profile",
                  style: TextStyle(color: Color.fromARGB(255, 164, 27, 210)),
                ),
              ),
            ),
            ListTile(
              onTap: () {Navigator.of(context).pushNamed('/event-description');},
              leading: const Icon(
                FontAwesomeIcons.calendar,
                color: Color.fromARGB(255, 164, 27, 210),
              ),
              title: const Text(
                "Event Timeline",
                style: TextStyle(color: Color.fromARGB(255, 164, 27, 210)),
              ),
            ),
            ListTile(
              onTap: () {Navigator.of(context).pushReplacementNamed('/voice-meetings');},

              leading: const  Icon(
                FontAwesomeIcons.microphone,
                color: Color.fromARGB(255, 164, 27, 210),
              ),
              title:const  Text(
                "Voice Calling",
                style: TextStyle(color: Color.fromARGB(255, 164, 27, 210)),
              ),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.arrowRightFromBracket,
                color: Color.fromARGB(255, 164, 27, 210),
              ),
              title: Text(
                "Event Timeline",
                style: TextStyle(color: Color.fromARGB(255, 164, 27, 210)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
