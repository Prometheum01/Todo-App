import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:todo_app/core/const/border.dart';
import 'package:todo_app/core/const/color.dart';
import 'package:todo_app/core/const/padding.dart';
import 'package:todo_app/core/const/radius.dart';
import 'package:todo_app/core/const/string.dart';
import 'package:todo_app/core/extension/date_time.dart';
import 'package:todo_app/core/extension/time_of_day.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/features/screens/new_task/view_model/new_task_view_model.dart';

import '../../../../product/model/task_type/task_type.dart';
import '../../../../product/widgets/widgets.dart';

part 'package:todo_app/features/screens/new_task/components/title.dart';
part 'package:todo_app/features/screens/new_task/components/task_type_list.dart';
part 'package:todo_app/features/screens/new_task/components/time_field.dart';
part 'package:todo_app/features/screens/new_task/components/date_field.dart';
part 'package:todo_app/features/screens/new_task/components/add_button.dart';
part 'package:todo_app/features/screens/new_task/components/underline.dart';
part 'package:todo_app/features/screens/new_task/components/description_field.dart';
part 'package:todo_app/features/screens/new_task/components/title_field.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends NewTaskViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.dynamicWidth(0.75),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: RadiusConst.largeHorizontalLeft(),
        ),
        child: SafeArea(
          child: Padding(
            padding: const PaddingConst.smallAll(),
            child: Form(
              key: validatorKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(flex: 1, child: _Title()),
                  const Flexible(flex: 1, child: _TaskTypeList()),
                  Flexible(
                    flex: 1,
                    child: _TaskTitleField(
                      controller: titleController,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: _TaskDescriptionField(
                      controller: descriptionController,
                    ),
                  ),
                  const Flexible(flex: 1, child: _TaskDateField()),
                  const Flexible(flex: 1, child: _TaskTimeField()),
                  Flexible(
                    flex: 1,
                    child: _AddButton(
                      onPressed: () {
                        addNewTask();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
