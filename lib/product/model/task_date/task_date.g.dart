// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDateAdapter extends TypeAdapter<TaskDate> {
  @override
  final int typeId = 2;

  @override
  TaskDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDate(
      year: fields[0] as int,
      month: fields[1] as int,
      day: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDate obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
