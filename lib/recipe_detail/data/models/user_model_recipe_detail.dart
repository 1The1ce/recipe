class UserModelInRecipeDetail {
  final int id;
  final String username, firstName,lastName, image;

  UserModelInRecipeDetail({
    required this.id,
    required this.username,
    required this.image,
    required this.firstName,
    required this.lastName
  });

  factory UserModelInRecipeDetail.fromJson(Map<String, dynamic> json) {
    return UserModelInRecipeDetail(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['profilePhoto'],
    );
  }
}
