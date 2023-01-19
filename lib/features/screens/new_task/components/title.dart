part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConst.newTask.toUpperCase(),
      style: context.textTheme.headline2,
    );
  }
}
