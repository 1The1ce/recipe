class User {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
