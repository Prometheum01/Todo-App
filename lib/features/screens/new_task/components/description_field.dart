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
        Padding(
          padding: const PaddingConst.smallSymmetricVertical(),
          child: Text(
            StringConst.description.toCapitalized(),
            style: context.textTheme.bodyMedium,
          ),
        ),
        Flexible(
          child: TextFormField(
            controller: _controller,
            style: context.textTheme.headlineSmall,
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: StringConst.descriptionHint.toCapitalized(),
              hintStyle: context.textTheme.bodyMedium,
              enabledBorder: OutlineBorderConst.descriptionField(),
              focusedBorder: OutlineBorderConst.descriptionField(),
              errorBorder: OutlineBorderConst.descriptionErrorField(),
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
        ),
      ],
    );
  }
}
