import 'package:spukify/models/album.dart';

class Track {
  final String id;
  final String name;
  final String uri;
  final int duration;
  final bool explicit;
  final String cover;
  final Album album;

  Track({
    required this.id,
    required this.name,
    required this.uri,
    required this.duration,
    required this.explicit,
    required this.cover,
    required this.album,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      name: json['name'],
      uri: json['uri'],
      duration: json['duration'],
      explicit: json['explicit'],
      cover: json['cover'],
      album: Album.fromJson(json['album']),
    );
  }
}