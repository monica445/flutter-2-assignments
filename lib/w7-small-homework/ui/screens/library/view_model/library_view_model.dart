import 'package:flutter/widgets.dart';
import 'package:flutter_assignments/w7-small-homework/data/repositories/songs/song_repository.dart';
import 'package:flutter_assignments/w7-small-homework/model/songs/song.dart';
import 'package:flutter_assignments/w7-small-homework/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
  });

  List<Song> _songs = [];
  List<Song> get songs => _songs;

  void init() {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  void start(Song song) {
    playerState.start(song);
    notifyListeners();
  }

  void stop() {
    playerState.stop();
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;
}
