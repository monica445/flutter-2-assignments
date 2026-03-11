import 'package:flutter/material.dart';
import 'package:flutter_assignments/w8-small-homework/ui/states/async_value.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    LibraryViewModel mv = context.watch<LibraryViewModel>();
    final asyncValue = mv.songsValue;

    Widget content;

    //view handle async state from mv
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = const Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = const Center(child: Text('Error loading songs'));
        break;
      case AsyncValueState.success:
        final songs = asyncValue.data!;
        content = ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) => SongTile(
            song: songs[index],
            isPlaying: mv.isSongPlaying(songs[index]),
            onTap: () {
              mv.start(songs[index]);
            },
          ),
        );
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Expanded(
            child: content
          ),
        ],
      ),
    );
  }
}
