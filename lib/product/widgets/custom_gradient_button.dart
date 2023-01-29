import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/color.dart';
import '../../core/const/padding.dart';
import '../../core/const/radius.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    super.key,
    required Function onPressed,
    required String text,
    List<Color>? colorList,
  }) {
    _onPressed = onPressed;
    _text = text;
    _colorList = colorList ??
        const [
          Color(
            ColorConst.palatinateBlue,
          ),
          Color(
            ColorConst.aqua,
          ),
        ];
  }

  late final Function _onPressed;
  late final String _text;
  late final List<Color> _colorList;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _onPressed();
        },
        borderRadius: const RadiusConst.xLargeAll(),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: const RadiusConst.xLargeAll(),
            gradient: LinearGradient(
              colors: _colorList,
            ),
          ),
          child: Padding(
            padding: const PaddingConst.xLargeSymmetricHorizontal() +
                const PaddingConst.mediumSymmetricVertical(),
            child: Text(
              _text.toCapitalized(),
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
