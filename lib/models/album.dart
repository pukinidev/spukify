enum AlbumType { album, single, compilation }

class Album {
  final String id;
  final String name;
  final String uri;
  final String cover;
  final AlbumType albumType;

  Album({
    required this.id,
    required this.name,
    required this.uri,
    required this.cover,
    required this.albumType,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      uri: json['uri'],
      cover: json['cover'],
      albumType: AlbumType.values.firstWhere((e) => e.toString() == 'AlbumType.' + json['albumType']),
    );
  }
}