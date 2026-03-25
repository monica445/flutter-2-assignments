import 'package:flutter/material.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/data/repositories/artist/artist_repository.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/data/repositories/songs/song_repository.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/services/song_service.dart';
import 'package:provider/provider.dart';
import 'view_model/library_view_model.dart';
import '../../states/player_state.dart';
import 'widgets/library_content.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        playerState: context.read<PlayerState>(),
        songService: SongService(
          songRepository: context.read<SongRepository>(), 
          artistRepository: context.read<ArtistRepository>()
        )
      ),
      child: LibraryContent(),
    );
  }
}
