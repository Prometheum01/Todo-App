import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/product/model/settings/settings.dart';

const String settingsDbKey = 'settings';

class SettingsHive {
  Future<void> initDB() async {
    Hive.registerAdapter(SettingsAdapter());

    Box<Settings> settingsBox = await Hive.openBox<Settings>(settingsDbKey);
    if (settingsBox.isEmpty) {
      await settingsBox.put(settingsDbKey, Settings.initialSettings());
    }
  }

  Future<void> changeSettings(Settings settings) async {
    await Hive.box<Settings>(settingsDbKey).put(settingsDbKey, settings);
  }

  Settings get settings =>
      Hive.box<Settings>(settingsDbKey).get(settingsDbKey) ??
      Settings.initialSettings();
}
