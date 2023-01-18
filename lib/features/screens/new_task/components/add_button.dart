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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _onPressed();
          },
          borderRadius: const RadiusConst.xLargeAll(),
          child: Ink(
            decoration: const BoxDecoration(
              borderRadius: RadiusConst.xLargeAll(),
              gradient: LinearGradient(
                colors: [
                  Color(
                    ColorConst.palatinateBlue,
                  ),
                  Color(
                    ColorConst.aqua,
                  ),
                ],
              ),
            ),
            child: Padding(
              padding: const PaddingConst.xLargeSymmetricHorizontal() +
                  const PaddingConst.mediumSymmetricVertical(),
              child: Text(
                StringConst.addTask.toUpperCase(),
                style: context.textTheme.headline3?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
