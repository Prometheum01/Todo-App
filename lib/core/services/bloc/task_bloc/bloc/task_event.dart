part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> props() => [];
}

class LoadTask extends TaskEvent {}

class AddNewTask extends TaskEvent {
  final Task newTask;

  const AddNewTask({required this.newTask});

  @override
  List<Object> props() => [newTask];
}

class DoneTask extends TaskEvent {}

class DeleteTask extends TaskEvent {}

class SelectTask extends TaskEvent {
  final Task selectedTask;

  const SelectTask({required this.selectedTask});

  @override
  List<Object> props() => [selectedTask];
}
