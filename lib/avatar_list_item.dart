library avatar_list;

import 'package:flutter/material.dart';

class AvatarListItem extends StatelessWidget {
  const AvatarListItem({
    Key? key,
    this.radius = 30,
    required this.imageProvider,
  }) : super(key: key);

  final double radius;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      backgroundImage: imageProvider,
    );
  }
}
