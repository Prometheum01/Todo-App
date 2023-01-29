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

        if (state.waitingTaskList.contains(event.taskList.first)) {
          state.waitingTaskList.remove(event.taskList.first);
        }

        emit(
          TaskLoaded(
            waitingTaskList: state.waitingTaskList,
            doneTaskList: List.from(state.doneTaskList)
              ..add(
                event.taskList.first.copyWith(isDone: true),
              ),
          ),
        );

        TaskHive(dbKey: waitingTaskDbKey).deleteTask(event.taskList);
        await TaskHive(dbKey: doneTaskDbKey)
            .addNewTask([event.taskList.first.copyWith(isDone: true)]);
      } else if (state is TaskSelection) {
        final state = this.state as TaskSelection;

        for (Task task in event.taskList) {
          if (state.waitingTaskList.contains(task)) {
            state.waitingTaskList.remove(task);
          }
        }

        List<Task> changedList =
            event.taskList.map((e) => e.copyWith(isDone: true)).toList();

        emit(
          TaskLoaded(
            waitingTaskList: state.waitingTaskList,
            doneTaskList: List.from(state.doneTaskList)..addAll(changedList),
          ),
        );

        TaskHive(dbKey: waitingTaskDbKey).deleteTask(event.taskList);
        await TaskHive(dbKey: doneTaskDbKey).addNewTask(changedList);
      }
    });

    on<UndoneTask>((event, emit) async {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;

        Task task = event.taskList.first;

        if (state.doneTaskList.contains(task)) {
          state.doneTaskList.remove(task);
        }

        emit(
          TaskLoaded(
              waitingTaskList: List.from(state.waitingTaskList)
                ..add(task.copyWith(isDone: false)),
              doneTaskList: state.doneTaskList),
        );

        await TaskHive(dbKey: waitingTaskDbKey)
            .addNewTask([task.copyWith(isDone: false)]);
        TaskHive(dbKey: doneTaskDbKey).deleteTask(event.taskList);
      } else if (state is TaskSelection) {
        final state = this.state as TaskSelection;

        for (Task task in event.taskList) {
          if (state.doneTaskList.contains(task)) {
            state.doneTaskList.remove(task);
          }
        }

        List<Task> changedList =
            event.taskList.map((e) => e.copyWith(isDone: false)).toList();

        emit(
          TaskLoaded(
              waitingTaskList: List.from(state.waitingTaskList)
                ..addAll(changedList),
              doneTaskList: state.doneTaskList),
        );

        await TaskHive(dbKey: waitingTaskDbKey).addNewTask(changedList);
        TaskHive(dbKey: doneTaskDbKey).deleteTask(event.taskList);
      }
    });

    on<DeleteTask>((event, emit) {
      if (state is TaskLoaded) {
        final state = this.state as TaskLoaded;
        if (!event.isInDoneDb) {
          List<Task> taskList = List.of(state.waitingTaskList).toList();
          if (taskList.contains(event.task)) {
            taskList.remove(event.task);
          }

          emit(
            TaskLoaded(
                waitingTaskList: taskList, doneTaskList: state.doneTaskList),
          );
          TaskHive(dbKey: waitingTaskDbKey).deleteTask([event.task]);
        } else {
          List<Task> taskList = List.of(state.doneTaskList).toList();
          if (taskList.contains(event.task)) {
            taskList.remove(event.task);
          }

          emit(
            TaskLoaded(
                waitingTaskList: state.waitingTaskList, doneTaskList: taskList),
          );
          TaskHive(dbKey: doneTaskDbKey).deleteTask([event.task]);
        }
      }
    });

    on<DeleteTaskList>((event, emit) {
      if (state is TaskSelection) {
        final state = this.state as TaskSelection;
        if (!event.isInDoneDb) {
          List<Task> taskList = List.of(state.waitingTaskList).toList();

          for (Task task in event.taskList) {
            if (taskList.contains(task)) {
              taskList.remove(task);
            }
          }

          emit(
            TaskLoaded(
                waitingTaskList: taskList, doneTaskList: state.doneTaskList),
          );
          TaskHive(dbKey: waitingTaskDbKey).deleteTask(event.taskList);
        } else {
          List<Task> taskList = List.of(state.doneTaskList).toList();

          for (Task task in event.taskList) {
            if (taskList.contains(task)) {
              taskList.remove(task);
            }
          }

          emit(
            TaskLoaded(
                waitingTaskList: state.waitingTaskList, doneTaskList: taskList),
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
