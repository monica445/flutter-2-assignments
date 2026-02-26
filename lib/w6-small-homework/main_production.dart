import 'package:blabla/w6-small-homework/data/repositories/songs/song_repository_remote.dart';
import 'package:provider/provider.dart';

import 'data/repositories/songs/song_repository.dart';
import 'main_common.dart';

/// Configure provider dependencies for dev environement
List<Provider> get providersLocal {
  return [Provider<SongRepository>(create: (context) => SongRepositoryRemote())];
}

void main() {
  mainCommon(providersLocal);
}
