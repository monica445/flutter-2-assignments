import 'package:flutter/material.dart';
import 'package:flutter_assignments/w8-small-homework/ui/states/async_value.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  AsyncValue<List<Song>> songsValue = AsyncValue.loading();
  // AsyncValue<Song>? songValue;

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  Future<void> _init() async {
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Song> songs = await songRepository.fetchSongs();
      songsValue = AsyncValue.success(songs);
    } catch (error) {
      songsValue = AsyncValue.error(error);
    }

    notifyListeners();
  }

  // Future<void> fetchSongById(String id) async {
  //   songValue = AsyncValue.loading();
  //   notifyListeners();

  //   try {
  //     Song? song = await songRepository.fetchSongById(id);

  //     songValue = AsyncValue.success(song);
  //   } catch (e) {
  //     songValue = AsyncValue.error(e);
  //   }

  //   notifyListeners();
  // }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
