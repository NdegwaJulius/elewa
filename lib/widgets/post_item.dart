import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/photo_model.dart';
import '../models/comment_model.dart';

class PostItem extends StatefulWidget {
  final PostModel post;

  PostItem({required this.post});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int _visibleCommentCount = 2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.post.title),
      subtitle: Text(widget.post.body),
      leading: widget.post.photos?.isNotEmpty == true
          ? Image.network(widget.post.photos![0].photoUrl)
          : Icon(Icons.image_not_supported),
      onTap: () {
        setState(() {
          _visibleCommentCount += 2;
        });
      },
      // Display up to 2 comments
      // Use null-aware access operator '?.' to handle nullable comments
      trailing: Column(
        children: [
          Text('Likes: ${widget.post.likes ?? 0}'),
          if (widget.post.comments?.isNotEmpty == true &&
              widget.post.comments!.length! > _visibleCommentCount) // Fixing the null check
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _visibleCommentCount += 2;
                });
              },
              child: Text('Load more comments'),
            ),
          if (widget.post.comments?.isNotEmpty == true)
            ...widget.post.comments!
                .take(_visibleCommentCount)
                .map(
                  (comment) => Text('${comment.name}: ${comment.body}'),
            )
                .toList(),
        ],
      ),
    );
  }
}
