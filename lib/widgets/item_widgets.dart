import 'package:flutter/material.dart';

import '../models/speakers.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  })  : assert(item != null),
        super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(item.imageUrl)),
        title: Text(item.name),
        subtitle: Text(item.desc),
      ),
    );
  }
}
