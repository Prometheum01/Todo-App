part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskTitleField extends StatelessWidget {
  _TaskTitleField({
    required TextEditingController controller,
  }) {
    _controller = controller;
  }

  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConst.title.toCapitalized(),
          style: context.textTheme.headline5,
        ),
        Stack(
          children: [
            TextFormField(
              controller: _controller,
              style: context.textTheme.headline4,
              onFieldSubmitted: (value) {},
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: StringConst.titleHint.toCapitalized(),
                hintStyle: context.textTheme.headline5,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                height: 1,
                width: context.dynamicWidth(1),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(ColorConst.palatinateBlue),
                      Color(ColorConst.deepPink),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
