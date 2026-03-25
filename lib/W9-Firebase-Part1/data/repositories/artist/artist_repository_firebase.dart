import 'dart:convert';
import 'package:flutter_assignments/W9-Firebase-Part1/data/dtos/artist_dto.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/data/repositories/artist/artist_repository.dart';
import 'package:flutter_assignments/W9-Firebase-Part1/model/artist/artist.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase extends ArtistRepository {
  @override
  Future<List<Artist>> fetchArtists() async {
    final Uri artistsUri = Uri.https(
      'w9-database-f3cdd-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/artists.json',
    );

    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = json.decode(response.body);

      List<Artist> artists = [];

      artistJson.forEach((key, value) {
        artists.add(ArtistDto.fromJson(key, Map<String, dynamic>.from(value)));
      });

      return artists;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load artist');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    final Uri artistUri = Uri.https(
      'w9-database-f3cdd-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/artists/$id.json',
    );

    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic>? jsonMap = json.decode(response.body);
      if (jsonMap != null) {
        return ArtistDto.fromJson(id, Map<String, dynamic>.from(jsonMap));
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to fetch artist with id $id');
    }
  }
}
