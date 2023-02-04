import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/const/image.dart';

class DoneOrCircleIcon extends StatelessWidget {
  const DoneOrCircleIcon({
    super.key,
    required this.isDone,
    this.color,
  });

  final bool isDone;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isDone ? ImageConst.doneTickIconPath : ImageConst.circleIconPath,
      color: color?.withOpacity(0.8),
    );
  }
}
