import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final double padding;
  final Icon? icon;
  final Color? color;
  final double? width;
  const CustomButton(
      {Key? key,
      this.onTap,
      this.title,
      this.padding = 5,
      this.icon,
      this.color,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: color != null ? color! : customBorderColor(context),
            )),
        child: icon != null ? icon : Text(title!),
      ),
    );
  }
}
