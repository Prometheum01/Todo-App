part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskTimeField extends StatelessWidget {
  const _TaskTimeField({
    Key? key,
  }) : super(key: key);

  Future<void> getTime(BuildContext context) async {
    TimeOfDay initialTime =
        (context.read<NewTaskCubit>().state as NewTaskFilling)
            .newTask
            .time
            .toTimeOfDay;

    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (timeOfDay != null) {
      // ignore: use_build_context_synchronously
      context.read<NewTaskCubit>().changeTime(timeOfDay.toTaskTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringConst.time.toCapitalized(),
          style: context.textTheme.headline5,
        ),
        BlocBuilder<NewTaskCubit, NewTaskState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                await getTime(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const PaddingConst.smallSymmetricVertical(),
                    child: Text(
                      state is NewTaskFilling
                          ? state.newTask.time.formatTime
                          : StringConst.timeHint.toCapitalized(),
                      style: context.textTheme.headline4,
                    ),
                  ),
                  const _Underline(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
