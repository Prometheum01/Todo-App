import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/const/theme.dart';

part 'settings.g.dart';

@HiveType(typeId: 5)
class Settings extends Equatable {
  @HiveField(0)
  final bool isLightTheme;
  @HiveField(1)
  final bool isAuthenticated;

  ThemeData get theme =>
      isLightTheme ? ThemeConst.lightTheme : ThemeConst.darkTheme;

  static Settings initialSettings() =>
      const Settings(isLightTheme: true, isAuthenticated: false);

  const Settings({required this.isLightTheme, required this.isAuthenticated});

  Settings copyWith({bool? isLightTheme, bool? isAuthenticated}) => Settings(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated);

  @override
  List<Object?> get props => [isLightTheme, isAuthenticated];
}
