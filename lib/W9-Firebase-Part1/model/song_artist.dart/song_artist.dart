import 'package:flutter_assignments/W9-Firebase-Part1/model/artist/artist.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/model/songs/song.dart';

class SongArtist {
  final Artist artist;
  final Song song;

  const SongArtist({required this.artist, required this.song});
}
