import 'package:flutter/material.dart';
import 'my_posts_screen.dart'; // Import the MyPostsScreen widget
import '../models/post_model.dart'; // Import the PostModel class

class UserProfileScreen extends StatelessWidget {
  // Replace this list with the actual user posts obtained from your API or database
  final List<PostModel> userPosts = [
    PostModel(id: 1, title: 'Post 1', body: 'This is the body of post 1'),
    PostModel(id: 2, title: 'Post 2', body: 'This is the body of post 2'),
    // Add more posts here...
  ];

  @override
  Widget build(BuildContext context) {
    return MyPostsScreen(userPosts: userPosts); // Pass the list of userPosts to MyPostsScreen
  }
}
