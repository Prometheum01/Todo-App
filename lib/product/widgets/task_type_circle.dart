import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/padding.dart';
import '../model/task_type/task_type.dart';

class TaskTypeCircle extends StatelessWidget {
  const TaskTypeCircle({Key? key, required this.type}) : super(key: key);

  final TaskType type;

  @override
  Widget build(BuildContext context) {
    return GradientIconCircle(type: type);
  }
}

class GradientIconCircle extends StatelessWidget {
  const GradientIconCircle({
    Key? key,
    required this.type,
  }) : super(key: key);

  final TaskType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.075),
      width: context.dynamicWidth(0.075),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(type.colorList.first),
            Color(type.colorList.last),
          ],
        ),
      ),
      child: Padding(
        padding: const PaddingConst.smallAll(),
        child: SvgPicture.asset(
          type.iconPath,
        ),
      ),
    );
  }
}
