import 'package:flutter/material.dart';


import '../data/api_service.dart';
import '../models/post_model.dart';
import '../widgets/post_item.dart';

class FollowingScreen extends StatefulWidget {
  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  List<PostModel> _followingPosts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFollowingPosts();
  }

  Future<void> _loadFollowingPosts() async {
    try {
      // Fetch posts from users the authenticated user is following
      // You'll need to implement this API call based on your backend system
      final followingPosts = await JsonPlaceholderApi.getPosts();
      setState(() {
        _followingPosts = followingPosts.map((postJson) => PostModel.fromJson(postJson as Map<String, dynamic>)).toList();
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching following posts: $error');
      // Handle error
    }
  }

  Future<void> _onRefresh() async {
    // Reload following posts when the user pulls down to refresh
    await _loadFollowingPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _onRefresh,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _followingPosts.length,
        itemBuilder: (ctx, index) {
          final post = _followingPosts[index];
          return PostItem(post: post);
        },
      ),
    );
  }
}
