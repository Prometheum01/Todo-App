import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../product/model/task/task.dart';

part 'slide_state.dart';

class SlideCubit extends Cubit<SlideState> {
  SlideCubit() : super(SlideInitial());

  changeSliderTask(Task newTask) {
    emit(SliderSelected(task: newTask));
  }

  removeSliderTask() {
    emit(SlideInitial());
  }
}
