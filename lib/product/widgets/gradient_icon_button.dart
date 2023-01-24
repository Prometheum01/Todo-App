import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/padding.dart';
import '../../core/const/radius.dart';

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    Key? key,
    required this.onPressed,
    required this.colorList,
    required this.iconPath,
  }) : super(key: key);

  final Function onPressed;
  final List<Color> colorList;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      borderRadius: const RadiusConst.circleAll(),
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
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
