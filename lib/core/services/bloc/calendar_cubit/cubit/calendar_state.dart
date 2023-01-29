part of 'calendar_cubit.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarCreated extends CalendarState {
  final int selectedIndex;

  final int selectedMonthIndex;

  final int selectedYear;

  final List<Task> selectedTaskList;

  final List<TaskDate> taskDateList;

  const CalendarCreated({
    required this.selectedIndex,
    required this.selectedMonthIndex,
    required this.selectedYear,
    required this.selectedTaskList,
    required this.taskDateList,
  });

  @override
  List<Object> get props => [
        selectedIndex,
        selectedMonthIndex,
        selectedYear,
        selectedTaskList,
        taskDateList
      ];

  CalendarCreated copyWith({
    int? selectedIndex,
    int? selectedMonthIndex,
    int? selectedYear,
    List<Task>? selectedTaskList,
    List<TaskDate>? taskDateList,
  }) {
    return CalendarCreated(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedMonthIndex: selectedMonthIndex ?? this.selectedMonthIndex,
      selectedTaskList: selectedTaskList ?? this.selectedTaskList,
      selectedYear: selectedYear ?? this.selectedYear,
      taskDateList: taskDateList ?? this.taskDateList,
    );
  }
}
