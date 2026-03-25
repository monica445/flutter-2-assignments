
import 'package:flutter_assignments/W9-Firebase-Part1/model/artist/artist.dart';

class ArtistDto {
  static const String nameKey = 'name';
  static const String genretKey = 'genre';
  static const String imageKey = 'imageUrl';

  //accept id separately
  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[genretKey] is String);
    assert(json[imageKey] is String);

    return Artist(
      id: id,
      name: json[nameKey],
      genre: json[genretKey],
      imageUrl: Uri.parse(json[imageKey]), //convert string -> uri
    );
  }

  /// Convert Artist to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      nameKey: artist.name,
      genretKey: artist.genre,
      imageKey: artist.imageUrl.toString(), //convert uri -> string
    };
  }
}
