import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/services/bloc/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:todo_app/core/services/bloc/new_task_cubit/cubit/new_task_cubit.dart';
import 'package:todo_app/core/services/bloc/slide_cubit/cubit/slide_cubit.dart';
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
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: TextTheme(
              displayMedium: GoogleFonts.baloo2().copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              displaySmall: GoogleFonts.baloo2().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              headlineLarge: GoogleFonts.lato().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
              headlineMedium: GoogleFonts.lato().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              headlineSmall: GoogleFonts.lato().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              bodyMedium: GoogleFonts.lato().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Colors.black.withOpacity(0.2),
              ),
              bodySmall: GoogleFonts.lato().copyWith(
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
