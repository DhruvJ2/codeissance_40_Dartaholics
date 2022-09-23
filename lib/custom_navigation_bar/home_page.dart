import 'package:flutter/material.dart';

import 'drawer_menu_widget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? openDrawer;


  const HomePage({super.key, this.openDrawer});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: DrawerMenuWidget(onClicked: widget.openDrawer),
        title: const Text("Home Page"),

      ),
    );
  }
}
