part of 'package:todo_app/features/screens/task_detail/view/task_detail_view.dart';

class _Title extends StatelessWidget {
  const _Title({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineLarge,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
