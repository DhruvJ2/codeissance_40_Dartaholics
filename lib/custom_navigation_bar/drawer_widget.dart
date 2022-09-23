import 'package:flutter/material.dart';

import 'drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ),
    );
  }
  
  buildDrawerItems(BuildContext context) =>  Container(
    padding: const EdgeInsets.only(top:210),
    child: Column(
      children: 
        DrawerItems.all
        .map(
          (item) => ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8,),
              leading: Icon(item.icon, color: Colors.white, size: 20,),
              title: Text(item.title, style: const TextStyle(color: Colors.white, fontSize: 18,),),
            ),
        ).toList(),
      ),
  );
}
