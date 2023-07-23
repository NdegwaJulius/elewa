import 'package:elewa/models/photo_model.dart';

import 'comment_model.dart';

class PostModel {
  int id;
  String title;
  String body;
  List<PhotoModel>? photos;
  List<CommentModel>? comments;
  int? likes;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    this.photos,
    this.comments,
    this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, List<PhotoModel> photos, List<CommentModel> comments, int likes) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      photos: json['photos'] != null
          ? List<PhotoModel>.from(json['photos'].map((photo) => PhotoModel.fromJson(photo)))
          : null,
      comments: json['comments'] != null
          ? List<CommentModel>.from(json['comments'].map((comment) => CommentModel.fromJson(comment)))
          : null,
      likes: json['likes'],
    );
  }
}
