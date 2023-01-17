import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final x = 19;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
    );
  }
}
