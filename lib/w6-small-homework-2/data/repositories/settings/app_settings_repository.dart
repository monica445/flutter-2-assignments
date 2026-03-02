import 'package:flutter_assignments/w6-small-homework-2/model/settings/app_settings.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}
