import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/feed_screen.dart';
import 'screens/my_posts_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Make the isLoggedIn variable static
  static bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Your App Name',
      home: isLoggedIn
          ? DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('elewa Chat'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Feed'),
                Tab(text: 'My Posts'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FeedScreen(),
              MyPostsScreen(userPosts: []),
            ],
          ),
        ),
      )
          : LoginScreen(), // Show LoginScreen if user is not logged in
    );
  }
}
