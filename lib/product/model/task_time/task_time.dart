import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/const/string.dart';

part 'task_time.g.dart';

@HiveType(typeId: 2)
class TaskTime extends Equatable {
  @HiveField(0)
  final int hour;

  @HiveField(1)
  final int minute;

  @HiveField(2)
  final bool isAm;

  const TaskTime(
      {required this.hour, required this.minute, required this.isAm});

  String get formatTime {
    String textHour = hour < 10 ? '0$hour' : hour.toString();

    String textMinute = minute < 10 ? '0$minute' : minute.toString();

    String textIsAm = isAm
        ? StringConst.timeAm.toUpperCase()
        : StringConst.timePm.toUpperCase();

    return '$textHour:$textMinute $textIsAm';
  }

  TimeOfDay get toTimeOfDay => TimeOfDay(
        hour: isAm ? hour : hour + 12,
        minute: minute,
      );

  @override
  List<Object?> props() => [hour, minute, isAm];
}
