import 'package:flutter/material.dart';
import '../../../../data/repositories/artist/artist_repository.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/artist/artist.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';
import 'library_item_data.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final ArtistRepository artistRepository;

  final PlayerState playerState;

  AsyncValue<List<LibraryItemData>> data = AsyncValue.loading();

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
    required this.artistRepository,
  }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  final Set<String> likedSongIds = {};

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    data = AsyncValue.loading();
    notifyListeners();

    try {
      // 1- Fetch songs
      List<Song> songs = await songRepository.fetchSongs();

      // 2- Fethc artist
      List<Artist> artists = await artistRepository.fetchArtists();

      // 3- Create the mapping artistid-> artist
      Map<String, Artist> mapArtist = {};
      for (Artist artist in artists) {
        mapArtist[artist.id] = artist;
      }

      List<LibraryItemData> data = songs
          .map(
            (song) =>
                LibraryItemData(song: song, artist: mapArtist[song.artistId]!),
          )
          .toList();

      this.data = AsyncValue.success(data);

    } catch (e) {
      // 3- Fetch is unsucessfull
      data = AsyncValue.error(e);
    }
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();

  Future<void> likeSong(Song song) async {
    if (likedSongIds.contains(song.id)) return;

    likedSongIds.add(song.id); 
    notifyListeners();

    try {
      await songRepository.updateLikes(song.id, song.likes + 1);
    } catch (e) {
      print("Like failed: $e");

      likedSongIds.remove(song.id);
      notifyListeners();
    }
  }

  bool isLiked(Song song) => likedSongIds.contains(song.id);

  //force fetching data from api instead of fetching from catch
  Future<void> refresh() async {
    // 🔥 SHOW LOADING
    data = AsyncValue.loading();
    notifyListeners();

    try {
      final songs = await songRepository.fetchSongs(forceFetch: true);
      final artists = await artistRepository.fetchArtists(forceFetch: true);

      final mapArtist = {for (var a in artists) a.id: a};

      data = AsyncValue.success(
        songs
            .map(
              (s) => LibraryItemData(song: s, artist: mapArtist[s.artistId]!),
            )
            .toList(),
      );
    } catch (e) {
      data = AsyncValue.error(e);
    }

    notifyListeners();
  }
}
