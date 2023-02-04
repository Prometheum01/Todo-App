import 'package:flutter/material.dart';
import 'package:todo_app/core/const/radius.dart';

class BoxDecorationConst extends BoxDecoration {
  BoxDecorationConst.whiteRounded(Color color, shadowColor)
      : super(
          color: color,
          borderRadius: const RadiusConst.smallAll(),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 1),
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        );
  BoxDecorationConst.whiteRoundedWShadow(Color color)
      : super(
          borderRadius: const RadiusConst.smallAll(),
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 1),
            )
          ],
        );
}
