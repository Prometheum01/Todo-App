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
          style: context.textTheme.bodyMedium,
        ),
        TextFormField(
          controller: _controller,
          style: context.textTheme.headlineSmall,
          decoration: InputDecoration(
            hintText: StringConst.titleHint.toCapitalized(),
            hintStyle: context.textTheme.bodyMedium,
            focusedBorder: UnderlineBorderConst.greyField(),
            enabledBorder: UnderlineBorderConst.greyField(),
          ),
          validator: (value) {
            if (value != null) {
              if (value.trim().isEmpty) {
                return StringConst.textFieldError;
              }
              return null;
            }
            return StringConst.textFieldError;
          },
        ),
      ],
    );
  }
}
