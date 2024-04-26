class Artist {

  final String name;
  final String id;
  final String uri;
  final int popularity;
  final int followers;
  final List<String> genres;
  final List<Map<String, dynamic>> images;

  Artist({
    required this.name,
    required this.id,
    required this.uri,
    required this.popularity,
    required this.followers,
    required this.genres,
    required this.images,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      id: json['id'],
      uri: json['uri'],
      popularity: json['popularity'],
      followers: json['followers']['total'],
      genres: List<String>.from(json['genres']),
      images: List<Map<String, dynamic>>.from(json['images']),
    );
  }

}
