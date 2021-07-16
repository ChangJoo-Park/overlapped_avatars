library overapped_avatars;

import 'package:flutter/material.dart';

enum AvatarListLeading {
  tight,
  loose,
  none,
}

class AvatarList extends StatefulWidget {
  const AvatarList({
    Key? key,
    required this.avatars,
    this.leading = AvatarListLeading.none,
    this.curve = Curves.easeInOutCubic,
    this.duration = const Duration(milliseconds: 200),
    this.scrollController,
  }) : super(key: key);

  final List<Widget> avatars;
  final AvatarListLeading leading;
  final Curve curve;
  final Duration duration;
  final ScrollController? scrollController;
  @override
  _AvatarListState createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {
  double leading = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthFactor = 1.0;
    switch (widget.leading) {
      case AvatarListLeading.tight:
        widthFactor = 0.6;
        break;
      case AvatarListLeading.loose:
        widthFactor = 0.8;
        break;
      case AvatarListLeading.none:
        break;
      default:
    }

    return ListView.builder(
      controller: widget.scrollController,
      cacheExtent: widget.avatars.length / 2,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.avatars.length,
      itemBuilder: (context, index) {
        return AnimatedAlign(
          widthFactor: widthFactor,
          alignment: Alignment.centerLeft,
          curve: widget.curve,
          duration: widget.duration,
          child: widget.avatars[index],
        );
      },
    );
  }
}
