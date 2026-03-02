import 'package:flutter/widgets.dart';
import 'package:flutter_assignments/w6-small-homework-2/data/repositories/settings/app_settings_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository _repository;
  AppSettings? _appSettings;

  AppSettingsState(this._repository);

  Future<void> init() async {
    _appSettings = await _repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;

    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    await _repository.save(_appSettings!);
    
    notifyListeners();
  }
}
