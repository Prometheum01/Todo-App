part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> props() => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> taskList;

  const TaskLoaded({required this.taskList});

  @override
  List<Object> props() => [taskList];
}

class TaskSelection extends TaskState {
  final List<Task> taskList;
  final List<Task> selectedTaskList;

  const TaskSelection({
    required this.selectedTaskList,
    required this.taskList,
  });

  @override
  List<Object> props() => [taskList, selectedTaskList];
}
