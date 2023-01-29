import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'task_date.g.dart';

@HiveType(typeId: 2)
class TaskDate extends Equatable {
  @HiveField(0)
  final int year;

  @HiveField(1)
  final int month;

  @HiveField(2)
  final int day;

  const TaskDate({required this.year, required this.month, required this.day});

  String get formatDate => DateFormat.MMMd().format(toDateTime);

  String get textMonth => DateFormat.MMM().format(toDateTime);

  String get textDay => DateFormat.E().format(toDateTime);

  DateTime get toDateTime => DateTime(year, month, day);

  @override
  List<Object?> get props => [year, month, day];
}
