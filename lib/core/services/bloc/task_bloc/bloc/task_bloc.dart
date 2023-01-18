import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/services/database/task_hive.dart';
import 'package:todo_app/product/model/task/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadTask>((event, emit) {
      emit(TaskLoaded(
        waitingTaskList: TaskHive(dbKey: waitingTaskDbKey).taskList,
        doneTaskList: TaskHive(dbKey: doneTaskDbKey).taskList,
      ));
    });

    on<AddNewTask>((event, emit) async {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        emit(
          TaskLoaded(
              waitingTaskList: List.from(state.waitingTaskList)
                ..add(event.newTask),
              doneTaskList: state.doneTaskList),
        );

        await TaskHive().addNewTask(event.newTask);
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
          emit(
            TaskLoaded(
                waitingTaskList: state.waitingTaskList,
                doneTaskList: state.doneTaskList),
          );
        } else {
          emit(
            TaskSelection(
                waitingTaskList: state.waitingTaskList,
                selectedTaskList: selectedList,
                doneTaskList: state.doneTaskList),
          );
        }
      }
    });
  }
}
