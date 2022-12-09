import 'package:flutter/material.dart';

class CustomSlideRoute extends PageRouteBuilder {
  final Widget page;
  final double x;
  final double y;
  CustomSlideRoute({required this.page, this.x = 1, this.y = 0})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
