import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/core/services/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:todo_app/core/services/database/task_hive.dart';
import 'package:todo_app/features/screens/task_list/view/task_list_view.dart';

void main() async {
  await TaskHive().initDB();

  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          textTheme: TextTheme(
              headline2: GoogleFonts.baloo2().copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              headline3: GoogleFonts.lato().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              headline4: GoogleFonts.lato().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              headline5: GoogleFonts.lato().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Colors.black.withOpacity(0.2),
              ),
              headline6: GoogleFonts.lato().copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.6),
              )),
        ),
        home: const TaskListView(),
      ),
    );
  }
}
