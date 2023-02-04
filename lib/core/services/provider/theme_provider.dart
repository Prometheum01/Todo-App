import 'package:flutter/material.dart';
import 'package:todo_app/core/const/theme.dart';
import 'package:todo_app/core/services/database/settings.dart';

import '../../const/color.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _selectedTheme = SettingsHive().settings.theme;

  Future<void> changeTheme() async {
    if (isLight) {
      _selectedTheme = ThemeConst.darkTheme;
    } else {
      _selectedTheme = ThemeConst.lightTheme;
    }
    await SettingsHive().changeSettings(
        SettingsHive().settings.copyWith(isLightTheme: isLight));
    notifyListeners();
  }

  Color get scaffoldBackground => isLight
      ? Colors.white.withOpacity(0.95)
      : const Color(ColorConst.backgroundDark);

  Color? get backgroundImage => isLight ? null : Colors.white;

  Color get cardColor => isLight
      ? Colors.white
      : const Color(ColorConst.containerBackground).withOpacity(0.8);

  Color get cardShadowColor =>
      isLight ? Colors.black.withOpacity(0.06) : Colors.white.withOpacity(0.06);

  Color get tileColor => isLight
      ? Colors.white.withOpacity(0.8)
      : const Color(ColorConst.containerBackground).withOpacity(0.8);

  Color get taskTileDOCText =>
      isLight ? Colors.black.withOpacity(0.8) : Colors.white.withOpacity(0.8);

  Color? get dialogBarrier => isLight ? null : Colors.white.withOpacity(0.5);

  Color get detailDescription => isLight
      ? const Color(ColorConst.descriptionColor)
      : Colors.white.withOpacity(0.8);

  Color get selectionButtonBackground =>
      isLight ? Colors.white : const Color(ColorConst.backgroundDark);

  ThemeData get selectedTheme => _selectedTheme ?? ThemeConst.lightTheme;

  bool get isLight =>
      _selectedTheme == null || _selectedTheme == ThemeConst.lightTheme;
}
