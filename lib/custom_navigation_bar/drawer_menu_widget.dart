import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback? onClicked;
  const DrawerMenuWidget({super.key, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClicked,
      color: Colors.white,
      icon: const FaIcon(FontAwesomeIcons.alignLeft),
    );
  }
}
