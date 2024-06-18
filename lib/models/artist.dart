class Artist {

  final String name;
  final String id;
  final String uri;
  final String image;

  Artist({
    required this.name,
    required this.id,
    required this.uri,
    required this.image,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'],
      id: json['id'],
      uri: json['uri'],
      image: json['image'],
    );
  }

}
