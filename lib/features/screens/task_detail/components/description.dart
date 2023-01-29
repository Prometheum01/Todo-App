part of 'package:todo_app/features/screens/task_detail/view/task_detail_view.dart';

class _Description extends StatelessWidget {
  const _Description({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.headlineMedium?.copyWith(
        color: const Color(ColorConst.descriptionColor),
      ),
      textAlign: TextAlign.center,
    );
  }
}
