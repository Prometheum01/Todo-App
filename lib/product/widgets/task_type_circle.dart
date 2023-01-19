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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const PaddingConst.smallSymmetricVertical(),
          child: Container(
            height: context.dynamicHeight(0.0125),
            width: context.dynamicWidth(0.0125),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(type.colorList[0]), Color(type.colorList[1])],
              ),
            ),
          ),
        ),
        Container(
          height: context.dynamicHeight(0.075),
          width: context.dynamicWidth(0.075),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(type.colorList[0]),
                Color(type.colorList[1]),
              ],
            ),
          ),
          child: Padding(
            padding: const PaddingConst.smallAll(),
            child: SvgPicture.asset(
              type.iconPath,
            ),
          ),
        ),
      ],
    );
  }
}
