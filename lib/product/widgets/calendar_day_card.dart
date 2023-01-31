import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/const/color.dart';
import '../../core/const/padding.dart';
import '../../core/const/radius.dart';
import '../model/task_date/task_date.dart';

const double calendarCardWidthMultiplier = 0.25;

class CalendarDayCard extends StatelessWidget {
  const CalendarDayCard({
    Key? key,
    this.onPressed,
    required this.taskDate,
    required this.isSelected,
  }) : super(key: key);

  final void Function()? onPressed;

  final TaskDate taskDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const RadiusConst.smallAll(),
      onTap: onPressed,
      child: Ink(
        width: context.dynamicWidth(calendarCardWidthMultiplier),
        decoration: BoxDecoration(
          borderRadius: const RadiusConst.smallAll(),
          color: isSelected ? null : Colors.transparent,
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(ColorConst.palatinateBlue),
                    Color(ColorConst.aqua),
                  ],
                )
              : null,
        ),
        child: Padding(
          padding: const PaddingConst.xLargeSymmetricHorizontal(),
          child: Center(
            child: _DayUnderText(
              taskDate: taskDate,
              isSelected: isSelected,
            ),
          ),
        ),
      ),
    );
  }
}

class _DayUnderText extends StatelessWidget {
  const _DayUnderText({
    required this.taskDate,
    required this.isSelected,
  });

  final TaskDate taskDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: taskDate.day.toString(),
        style: context.textTheme.displaySmall
            ?.copyWith(color: isSelected ? Colors.white : Colors.black),
        children: [
          TextSpan(
            text: '\n${taskDate.textDay}',
            style: context.textTheme.displaySmall
                ?.copyWith(color: isSelected ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
