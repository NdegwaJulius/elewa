import 'package:flutter/material.dart';
import '../data/api_service.dart';
import '../models/post_model.dart';
import '../models/photo_model.dart';
import '../models/comment_model.dart';
import '../widgets/post_item.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<PostModel> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      // Fetch posts from the API
      final List<PostModel> posts = await JsonPlaceholderApi.getPosts();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching posts: $error');
      // Handle error
    }
  }

  Future<void> _onRefresh() async {
    // Reload posts when the user pulls down to refresh
    await _loadPosts();
  }

  void _showPremiumAccessBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Premium Access',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Upgrade to Premium to get access to exclusive content and features!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement your payment logic here
                  // For this example, let's assume the payment is successful
                  Navigator.pop(context); // Close the bottom sheet after successful payment
                  _showPaymentSuccessDialog(); // Show a dialog indicating payment success
                },
                child: Text('Upgrade to Premium'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Payment Successful!'),
          content: Text('Congratulations! You now have Premium Access.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Navigate back to the FeedScreen
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Refresh'),
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
        itemCount: _posts.length,
        itemBuilder: (ctx, index) {
          final post = _posts[index];
          return PostItem(post: post);
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _showPremiumAccessBottomSheet,
        child: Text('Get Premium Access'),
      ),
    );
  }
}
