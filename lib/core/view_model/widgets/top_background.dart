import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class TopBackground extends StatelessWidget {
  final double height;
  final Widget? child;
  const TopBackground({Key? key, required this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: customScaffoldColor(context),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: child,
    );
  }
}
