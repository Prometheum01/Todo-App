part of 'slide_cubit.dart';

abstract class SlideState extends Equatable {
  const SlideState();

  @override
  List<Object> get props => [];
}

class SlideInitial extends SlideState {}

class SliderSelected extends SlideState {
  final Task task;

  const SliderSelected({required this.task});

  @override
  List<Object> get props => [task];
}
