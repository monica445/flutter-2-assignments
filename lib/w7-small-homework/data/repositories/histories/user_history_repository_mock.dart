import 'package:flutter_assignments/w7-small-homework/data/repositories/histories/user_history_repository.dart';
import 'package:flutter_assignments/w7-small-homework/model/songs/song.dart';

class UserHistoryRepositoryMock extends UserHistoryRepository {
  final List<Song> _historySongs = [];
  @override
  void addSong(Song song) {
      _historySongs.add(song);  
  }

  @override
  List<Song> getUserSongs() {
    return _historySongs;
  }
}
