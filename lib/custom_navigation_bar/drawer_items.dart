import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_item_model.dart';

class DrawerItems {
  static final home = DrawerItem("Home", FontAwesomeIcons.houseChimney);
  static final timelineEvent =
      DrawerItem("Event Timeline", FontAwesomeIcons.calendar);
  static final vc = DrawerItem("Voice Calling", FontAwesomeIcons.microphone);
  static final logout = DrawerItem("Logout", Icons.logout);
  static final List<DrawerItem> all = [home, timelineEvent,vc, logout];
}
