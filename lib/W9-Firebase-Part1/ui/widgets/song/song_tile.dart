import 'package:flutter/material.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/model/song_artist.dart/song_artist.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.songArtist,
    required this.isPlaying,
    required this.onTap,
  });

  final SongArtist songArtist;
  final bool isPlaying;
  final VoidCallback onTap;

  String get subtitle {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(songArtist.song.duration.inMinutes.remainder(60));
    final seconds = twoDigits(songArtist.song.duration.inSeconds.remainder(60));
    final durationStr = "$minutes:$seconds";

    return "$durationStr · ${songArtist.artist.name} - ${songArtist.artist.genre}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: 25, 
            backgroundImage: NetworkImage(songArtist.song.imageUrl.toString()),
            backgroundColor: Colors.grey[200],
          ),
          title: Text(songArtist.song.title),
          subtitle: Text(subtitle),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
