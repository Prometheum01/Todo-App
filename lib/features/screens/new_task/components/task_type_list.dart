part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskTypeList extends StatelessWidget {
  const _TaskTypeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringConst.icon.toTitleCase(),
          style: context.textTheme.bodyMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              TaskType.taskList.map((e) => TaskTypeButton(type: e)).toList(),
        ),
      ],
    );
  }
}
