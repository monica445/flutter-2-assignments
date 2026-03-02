import 'package:flutter_assignments/w6-small-homework-2/data/repositories/settings/app_settings_repository.dart';
import 'package:flutter_assignments/w6-small-homework-2/model/settings/app_settings.dart';

class AppSettingsRepositoryMock extends AppSettingsRepository {
  AppSettings? _settings;
  @override
  Future<AppSettings> load() async {
    return _settings ?? AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings settings) async{
    _settings = settings;
  }
}
