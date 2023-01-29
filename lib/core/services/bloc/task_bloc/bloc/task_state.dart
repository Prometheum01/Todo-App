part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> waitingTaskList;
  final List<Task> doneTaskList;

  const TaskLoaded({required this.waitingTaskList, required this.doneTaskList});

  @override
  List<Object> get props => [waitingTaskList, doneTaskList];
}

class TaskSelection extends TaskState {
  final List<Task> waitingTaskList;
  final List<Task> doneTaskList;
  final List<Task> selectedTaskList;

  const TaskSelection(
      {required this.selectedTaskList,
      required this.waitingTaskList,
      required this.doneTaskList});

  @override
  List<Object> get props => [waitingTaskList, doneTaskList, selectedTaskList];
}
