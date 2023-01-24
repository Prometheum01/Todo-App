import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/radius.dart';

class GradientContainerButton extends StatelessWidget {
  const GradientContainerButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.colorList,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final List<int> colorList;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const RadiusConst.smallAll(),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const RadiusConst.smallAll(),
        onTap: () {
          onPressed();
        },
        splashColor: Color(colorList.first),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: const RadiusConst.smallAll(),
            gradient: LinearGradient(
              colors: [
                Color(colorList.first),
                Color(
                  colorList.last,
                ),
              ],
            ),
          ),
          child: Center(
            child: Text(
              text.toCapitalized(),
              style: context.textTheme.headline2?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
