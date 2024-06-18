class User {
  final String id;
  final String email;
  final String username;
  final String image;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      image: json['image'],
    );
  }
}