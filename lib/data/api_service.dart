import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/comment_model.dart';
import '../models/photo_model.dart';
import '../models/post_model.dart';

class JsonPlaceholderApi {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<PostModel>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return await Future.wait(
          responseData.map((postJson) async {
            final List<PhotoModel> photos = await _getPhotosForPost(postJson['id']);
            final List<CommentModel> comments = await _getCommentsForPost(postJson['id']);
            final int likes = await _getLikesForPost(postJson['id']);
            return PostModel.fromJson(postJson, photos, comments, likes);
          }),
        );
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Error fetching posts: $error');
    }
  }

  static Future<List<CommentModel>> _getCommentsForPost(int postId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/comments?postId=$postId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((commentJson) => CommentModel.fromJson(commentJson)).toList();
      } else {
        throw Exception('Failed to load comments for post $postId');
      }
    } catch (error) {
      throw Exception('Error fetching comments for post $postId: $error');
    }
  }

  static Future<List<PhotoModel>> _getPhotosForPost(int postId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/photos?albumId=$postId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((photoJson) => PhotoModel.fromJson(photoJson)).toList();
      } else {
        throw Exception('Failed to load photos for post $postId');
      }
    } catch (error) {
      throw Exception('Error fetching photos for post $postId: $error');
    }
  }

  static Future<int> _getLikesForPost(int postId) async {
    try {
      // Fetch and return the number of likes for the post from your backend or mock API
      // You'll need to implement this API call based on your backend system
      return 0; // Replace with the actual number of likes
    } catch (error) {
      throw Exception('Error fetching likes for post $postId: $error');
    }
  }
}
