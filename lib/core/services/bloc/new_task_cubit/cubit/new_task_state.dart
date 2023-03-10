part of 'new_task_cubit.dart';

abstract class NewTaskState extends Equatable {
  const NewTaskState();

  @override
  List<Object> get props => [];
}

class NewTaskInitial extends NewTaskState {}

class NewTaskFilling extends NewTaskState {
  final Task newTask;

  const NewTaskFilling({required this.newTask});

  @override
  List<Object> get props => [newTask];
}
