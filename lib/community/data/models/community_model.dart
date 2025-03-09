import 'package:recipe_app/community/data/models/user_model.dart';

class CommunityModel {
  int id;
  String title, description, created, photo;
  num timeRequired, rating, reviewsCount;
  final User user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.created,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      created: json['created'],
      photo: json['photo'],
      timeRequired: json['timeRequired'] ?? 0,
      rating: json['rating'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
      user: User.fromJson(json['user']),
    );
  }
}
