import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'gradient_icon_button.dart';

class CircleButtonRow extends StatelessWidget {
  const CircleButtonRow({
    Key? key,
    required this.iconButtonList,
  }) : super(key: key);

  final List<GradientIconButton> iconButtonList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.15) * iconButtonList.length,
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: iconButtonList,
        ),
      ),
    );
  }
}
