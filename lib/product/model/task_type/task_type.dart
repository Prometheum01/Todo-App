import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/const/color.dart';

import '../../../core/const/image.dart';

part 'task_type.g.dart';

@HiveType(typeId: 1)
class TaskType extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String iconPath;

  @HiveField(2)
  final List<int> colorList;

  const TaskType(
      {required this.name, required this.iconPath, required this.colorList});

  static List<TaskType> get taskList => [
        const TaskType(
          name: 'Shopping',
          iconPath: ImageConst.shoppingIconPath,
          colorList: [ColorConst.deepPink, ColorConst.yellowOrange],
        ),
        const TaskType(
          name: 'Sport',
          iconPath: ImageConst.sportIconPath,
          colorList: [ColorConst.deepPink, ColorConst.palatinateBlue],
        ),
        const TaskType(
          name: 'Location',
          iconPath: ImageConst.locationIconPath,
          colorList: [ColorConst.palatinateBlue, ColorConst.yankeesBlue],
        ),
        const TaskType(
          name: 'Party',
          iconPath: ImageConst.partyIconPath,
          colorList: [ColorConst.palatinateBlue, ColorConst.aqua],
        ),
        const TaskType(
          name: 'Gym',
          iconPath: ImageConst.gymIconPath,
          colorList: [ColorConst.deepPink, ColorConst.palatinateBlue],
        ),
        const TaskType(
          name: 'Other',
          iconPath: ImageConst.otherIconPath,
          colorList: [ColorConst.yankeesBlue, ColorConst.romanSilver],
        ),
      ];

  @override
  List<Object?> props() => [name, iconPath, colorList];
}
