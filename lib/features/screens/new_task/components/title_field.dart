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
        TextFormField(
          controller: _controller,
          style: context.textTheme.headline4,
          onFieldSubmitted: (value) {},
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: StringConst.titleHint.toCapitalized(),
            hintStyle: context.textTheme.headline5,
            focusedBorder: UnderlineBorderConst.greyField(),
            enabledBorder: UnderlineBorderConst.greyField(),
          ),
          validator: (value) {
            if (value != null) {
              if (value.trim().isEmpty) {
                return 'Please fill this field';
              }
              return null;
            }
            return 'Please fill this field';
          },
        ),
      ],
    );
  }
}
