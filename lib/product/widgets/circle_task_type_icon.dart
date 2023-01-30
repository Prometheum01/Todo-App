import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/product/model/task_type/task_type.dart';

import '../../core/const/padding.dart';

class CircleTaskTypeIcon extends StatelessWidget {
  const CircleTaskTypeIcon({
    super.key,
    required this.taskType,
  });

  final TaskType taskType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(
              taskType.colorList.first,
            ),
            Color(
              taskType.colorList.last,
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const PaddingConst.smallAll(),
        child: SvgPicture.asset(
          taskType.iconPath,
        ),
      ),
    );
  }
}
