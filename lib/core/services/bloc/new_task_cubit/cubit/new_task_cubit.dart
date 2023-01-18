import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/product/model/task/task.dart';
import 'package:todo_app/product/model/task_type/task_type.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit()
      : super(
          NewTaskFilling(newTask: Task.emptyTask),
        );

  void clearCubit() {
    emit(
      NewTaskFilling(newTask: Task.emptyTask),
    );
  }

  void changeType(TaskType newTaskType) {
    if (state is NewTaskFilling) {
      final state = this.state as NewTaskFilling;

      emit(
        NewTaskFilling(newTask: state.newTask.copyWith(taskType: newTaskType)),
      );
    }
  }

  void changeDate(DateTime newDateTime) {
    if (state is NewTaskFilling) {
      final state = this.state as NewTaskFilling;

      emit(
        NewTaskFilling(
            newTask: state.newTask.copyWith(date: newDateTime.toString())),
      );
    }
  }

  void changeTime(TimeOfDay newTimeOfDay) {
    if (state is NewTaskFilling) {
      final state = this.state as NewTaskFilling;

      emit(
        NewTaskFilling(
            newTask: state.newTask.copyWith(time: newTimeOfDay.toString())),
      );
    }
  }
}
