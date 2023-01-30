import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/image.dart';

class DoneOrCircleIcon extends StatelessWidget {
  const DoneOrCircleIcon({
    Key? key,
    required this.isDonePage,
    required this.colorList,
  }) : super(key: key);

  final bool isDonePage;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isDonePage
          ? SvgPicture.asset(
              ImageConst.doneTickIconPath,
              color: colorList.first,
              width: context.dynamicWidth(0.01),
              height: context.dynamicHeight(0.01),
            )
          : Container(
              height: context.dynamicHeight(0.01),
              width: context.dynamicWidth(0.01),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [colorList.first, colorList.last],
                ),
              ),
            ),
    );
  }
}
