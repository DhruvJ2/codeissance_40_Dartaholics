import 'package:dartaholics/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset = 230;
  late double yOffset = 150;
  late double scalefactor = 0.6;
  bool isDragging = false;
  late bool isDrawerOpen;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scalefactor = 1;
        isDrawerOpen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scalefactor = 0.6;
        isDrawerOpen = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          buildDrawer(),
          buildPage(),
        ],
      ),
    );
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        onTap: closeDrawer,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 250,
          ),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scalefactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12
                    : Theme.of(context).primaryColor,
                child: Board(
                  openDrawer: openDrawer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() => const SafeArea(child: DrawerWidget());
}
