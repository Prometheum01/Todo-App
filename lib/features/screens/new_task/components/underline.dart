part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _Underline extends StatelessWidget {
  const _Underline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(ColorConst.palatinateBlue).withOpacity(
        0.12,
      ),
    );
  }
}
