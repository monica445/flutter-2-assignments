import 'package:flutter_assignments/w6-small-homework-2/data/repositories/settings/app_settings_repository.dart';
import 'package:flutter_assignments/w6-small-homework-2/data/repositories/settings/app_settings_repository_mock.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(
        AppSettingsRepositoryMock(),
      )..init(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
