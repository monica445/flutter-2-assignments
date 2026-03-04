import 'package:flutter/material.dart';
import 'package:flutter_assignments/w7-small-homework/data/repositories/songs/song_repository.dart';
import 'package:flutter_assignments/w7-small-homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_assignments/w7-small-homework/ui/screens/library/widgets/library_content.dart';
import 'package:flutter_assignments/w7-small-homework/ui/states/player_state.dart';
import 'package:provider/provider.dart';


class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(),
        playerState: context.watch<PlayerState>(),
      )..init(),
      child: const LibraryContent(),
    );
  }
}

