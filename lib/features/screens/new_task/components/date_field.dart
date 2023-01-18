part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskDateField extends StatelessWidget {
  const _TaskDateField({
    Key? key,
  }) : super(key: key);

  Future<void> getDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(
        DateTime.now().year,
      ),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (date != null) {
      // ignore: use_build_context_synchronously
      context.read<NewTaskCubit>().changeDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringConst.date.toCapitalized(),
          style: context.textTheme.headline5,
        ),
        BlocBuilder<NewTaskCubit, NewTaskState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                await getDate(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const PaddingConst.smallSymmetricVertical(),
                    child: Text(
                      state is NewTaskFilling
                          ? state.newTask.date.toString()
                          : StringConst.dateHint.toCapitalized(),
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
