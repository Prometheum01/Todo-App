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
                ..addAll(event.newTaskList),
              doneTaskList: state.doneTaskList),
        );

        await TaskHive().addNewTask(event.newTaskList);
      }
    });

    on<DoneTask>((event, emit) async {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        emit(
          TaskLoaded(
            waitingTaskList: List.from(state.waitingTaskList)
              ..remove(event.taskList),
            doneTaskList: List.from(state.doneTaskList)..addAll(event.taskList),
          ),
        );

        TaskHive(dbKey: waitingTaskDbKey).deleteTask(event.taskList);
        await TaskHive(dbKey: doneTaskDbKey).addNewTask(event.taskList);
      }
    });

    on<UndoneTask>((event, emit) async {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        emit(
          TaskLoaded(
              waitingTaskList: List.from(state.waitingTaskList)
                ..addAll(event.taskList),
              doneTaskList: List.from(state.doneTaskList)
                ..remove(event.taskList)),
        );

        await TaskHive(dbKey: waitingTaskDbKey).addNewTask(event.taskList);
        TaskHive(dbKey: doneTaskDbKey).deleteTask(event.taskList);
      }
    });

    on<DeleteTask>((event, emit) async {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        if (!event.isInDoneDb) {
          emit(
            TaskLoaded(
                waitingTaskList: List.from(state.waitingTaskList)
                  ..remove(event.taskList),
                doneTaskList: state.doneTaskList),
          );
          TaskHive(dbKey: waitingTaskDbKey).deleteTask(event.taskList);
        } else {
          emit(
            TaskLoaded(
                waitingTaskList: state.waitingTaskList,
                doneTaskList: List.from(state.waitingTaskList)
                  ..remove(event.taskList)),
          );
          TaskHive(dbKey: doneTaskDbKey).deleteTask(event.taskList);
        }
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
