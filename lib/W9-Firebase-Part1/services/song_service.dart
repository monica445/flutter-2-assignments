import 'package:flutter_assignments/W9-Firebase-Part1/data/repositories/artist/artist_repository.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/data/repositories/songs/song_repository.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/model/song_artist.dart/song_artist.dart';

class SongService {
  final SongRepository songRepository;
  final ArtistRepository artistRepository;

  SongService({required this.songRepository, required this.artistRepository});

  Future<List<SongArtist>> fetchSongWithArtist() async {
    final songs = await songRepository.fetchSongs();

    List<SongArtist> songWithArtists = [];

    for (var song in songs) {
      final artist = await artistRepository.fetchArtistById(song.artist);
      if (artist != null) {
        songWithArtists.add(
          SongArtist(
            song: song,
            artist: artist,
          ),
        );
      }
    }

    return songWithArtists;
  }
}
