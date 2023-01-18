// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTimeAdapter extends TypeAdapter<TaskTime> {
  @override
  final int typeId = 2;

  @override
  TaskTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskTime(
      hour: fields[0] as int,
      minute: fields[1] as int,
      isAm: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskTime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute)
      ..writeByte(2)
      ..write(obj.isAm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
