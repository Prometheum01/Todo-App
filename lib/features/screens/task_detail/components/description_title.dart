part of 'package:todo_app/features/screens/task_detail/view/task_detail_view.dart';

class _DescriptionTitle extends StatelessWidget {
  const _DescriptionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConst.description.toCapitalized(),
      style: context.textTheme.headline4?.copyWith(fontWeight: FontWeight.w900),
    );
  }
}
