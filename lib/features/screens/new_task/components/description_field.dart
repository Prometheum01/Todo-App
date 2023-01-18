part of 'package:todo_app/features/screens/new_task/view/new_task_view.dart';

class _TaskDescriptionField extends StatelessWidget {
  _TaskDescriptionField({required TextEditingController controller}) {
    _controller = controller;
  }

  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringConst.description.toCapitalized(),
          style: context.textTheme.headline5,
        ),
        Flexible(
          child: TextFormField(
            controller: _controller,
            style: context.textTheme.headline4,
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: StringConst.descriptionHint.toCapitalized(),
              hintStyle: context.textTheme.headline5,
              enabledBorder: OutlineBorderConst.descriptionField(),
              focusedBorder: OutlineBorderConst.descriptionField(),
              errorBorder: OutlineBorderConst.descriptionErrorField(),
            ),
          ),
        ),
      ],
    );
  }
}
