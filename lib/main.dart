import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/services/bloc/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/core/services/bloc/slide_cubit/cubit/slide_cubit.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/core/services/database/settings.dart';
import 'package:todo_app/core/services/database/task_hive.dart';
import 'package:todo_app/core/services/provider/theme_provider.dart';
import 'package:todo_app/features/screens/task_list/view/task_list_view.dart';

void main() async {
  await Hive.initFlutter();

  await TaskHive().initDB();

  await SettingsHive().initDB();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => NewTaskCubit(),
        ),
        BlocProvider(
          create: (context) => SlideCubit(),
        ),
        BlocProvider(
          create: (context) => CalendarCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeProvider>().selectedTheme,
        home: const TaskListView(),
      ),
    );
  }
}
