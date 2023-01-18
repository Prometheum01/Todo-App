part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _AddButton extends StatelessWidget {
  _AddButton({
    required Function onPressed,
  }) {
    _onPressed = onPressed;
  }

  late final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: () {
          _onPressed();
        },
        child: Text(
          StringConst.addTask.toCapitalized(),
        ),
      ),
    );
  }
}
