part of 'package:todo_app/features/screens/task_detail/view/task_detail_view.dart';

class _DateTime extends StatelessWidget {
  const _DateTime({required this.date, required this.time});

  final String date, time;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$date  ',
        style: context.textTheme.headlineSmall,
        children: [
          TextSpan(
            text: time,
            style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
