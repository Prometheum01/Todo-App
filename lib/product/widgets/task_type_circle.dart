import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/image.dart';

import '../../core/const/padding.dart';
import '../model/task_type/task_type.dart';

class TaskTypeCircle extends StatelessWidget {
  const TaskTypeCircle({Key? key, required this.type, this.isDone = false})
      : super(key: key);

  final TaskType type;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const PaddingConst.smallSymmetricVertical(),
          child: isDone
              ? SvgPicture.asset(
                  ImageConst.doneTickIconPath,
                  color: Color(type.colorList.first),
                  width: context.dynamicWidth(0.01),
                  height: context.dynamicHeight(0.01),
                )
              : Container(
                  height: context.dynamicHeight(0.01),
                  width: context.dynamicWidth(0.01),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(type.colorList[0]),
                        Color(type.colorList[1])
                      ],
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
