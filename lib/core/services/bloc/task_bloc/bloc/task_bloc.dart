import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/product/model/task/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskLoaded(taskList: [])) {
    on<AddNewTask>((event, emit) {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        emit(TaskLoaded(
            taskList: List.from(state.taskList)..add(event.newTask)));
      }
    });
    on<SelectTask>((event, emit) {
      if (state is TaskSelection) {
        final state = this.state as TaskSelection;

        List<Task> selectedList;

        if (state.selectedTaskList.contains(event.selectedTask)) {
          selectedList = List.from(state.selectedTaskList)
            ..remove(event.selectedTask);
        } else {
          selectedList = List.from(state.selectedTaskList)
            ..add(event.selectedTask);
        }

        if (selectedList.isEmpty) {
          emit(TaskLoaded(
            taskList: state.taskList,
          ));
        } else {
          emit(TaskSelection(
              taskList: state.taskList, selectedTaskList: selectedList));
        }
      }
    });
  }
}
