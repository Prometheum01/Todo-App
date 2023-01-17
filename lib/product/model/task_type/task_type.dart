import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

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
          colorList: [0xFFFE1E9A, 0xFFFEA64C],
        ),
        const TaskType(
          name: 'Gym',
          iconPath: ImageConst.gymIconPath,
          colorList: [0xFFFE1E9A, 0xFF254DDE],
        ),
        const TaskType(
          name: 'Location',
          iconPath: ImageConst.locationIconPath,
          colorList: [0xFF254DDE, 0xFF181743],
        ),
        const TaskType(
          name: 'Other',
          iconPath: ImageConst.otherIconPath,
          colorList: [0xFF181743, 0xFF88889F],
        ),
        const TaskType(
          name: 'Party',
          iconPath: ImageConst.partyIconPath,
          colorList: [0xFF254DDE, 0xFF00FFFF],
        ),
        const TaskType(
          name: 'Sport',
          iconPath: ImageConst.sportIconPath,
          colorList: [0xFFFE1E9A, 0xFF254DDE],
        ),
      ];

  @override
  List<Object?> props() => [name, iconPath, colorList];
}
