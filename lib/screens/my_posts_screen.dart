import 'package:flutter/material.dart';
import '../models/post_model.dart'; // Replace with the actual path to your PostModel class
import '../widgets/post_item.dart'; // Replace with the actual path to your PostItem widget

class MyPostsScreen extends StatefulWidget {
  final List<PostModel> userPosts; // Replace with the actual list of posts belonging to the authenticated user

  MyPostsScreen({required this.userPosts});

  @override
  _MyPostsScreenState createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Refresh'),
      ),
      body: ListView.builder(
        itemCount: widget.userPosts.length,
        itemBuilder: (context, index) {
          final post = widget.userPosts[index];
          return PostItem(post: post); // Replace with the actual PostItem widget to display individual posts
        },
      ),
    );
  }
}
