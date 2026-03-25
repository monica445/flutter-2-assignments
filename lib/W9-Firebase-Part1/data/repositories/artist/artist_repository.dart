import 'package:flutter_assignments/W9-Firebase-Part1/model/artist/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists();
}
