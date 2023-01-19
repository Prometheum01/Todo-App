part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> props() => [];
}

class LoadTask extends TaskEvent {}

class AddNewTask extends TaskEvent {
  final List<Task> newTaskList;

  const AddNewTask({required this.newTaskList});

  @override
  List<Object> props() => [newTaskList];
}

class DoneTask extends TaskEvent {
  final List<Task> taskList;

  const DoneTask({required this.taskList});

  @override
  List<Object> props() => [taskList];
}

class UndoneTask extends TaskEvent {
  final List<Task> taskList;

  const UndoneTask({required this.taskList});

  @override
  List<Object> props() => [taskList];
}

class DeleteTask extends TaskEvent {
  final List<Task> taskList;
  final bool isInDoneDb;

  const DeleteTask({required this.taskList, this.isInDoneDb = true});

  @override
  List<Object> props() => [taskList, isInDoneDb];
}

class SelectTask extends TaskEvent {
  final Task selectedTask;

  const SelectTask({required this.selectedTask});

  @override
  List<Object> props() => [selectedTask];
}
