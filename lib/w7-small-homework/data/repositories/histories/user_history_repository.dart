import 'package:flutter_assignments/w7-small-homework/model/songs/song.dart';

abstract class UserHistoryRepository {
  List<Song>? getUserSongs();
  void addSong(Song song);
}
