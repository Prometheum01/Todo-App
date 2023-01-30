import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/radius.dart';

import '../../core/const/padding.dart';

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    Key? key,
    this.onPressed,
    required this.colorList,
    required this.iconPath,
  }) : super(key: key);

  final void Function()? onPressed;
  final List<Color> colorList;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      borderRadius: const RadiusConst.smallAll(),
      radius: 0,
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: colorList,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 3),
              color: colorList.first.withOpacity(
                0.3,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const PaddingConst.mediumAll(),
          child: SizedBox(
            height: context.dynamicHeight(0.05),
            width: context.dynamicWidth(0.05),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
