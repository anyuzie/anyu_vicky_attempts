import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  final String username;
  final String title;
  final String caption;
  final String avatarImagePath;
  final bool showFullText; // Add a boolean parameter for showFullText

  AvatarWithUsernameAndTitle({
    required this.username,
    required this.title,
    required this.caption,
    required this.avatarImagePath,
    required this.showFullText, // Add showFullText parameter
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Avatar
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(avatarImagePath),
            radius: 20.0,
          ),
        ),
        // Username, Title, and Caption
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Username
              Text(
                username,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Title
              Text(
                title,
                style: TextStyle(fontSize: 24.0),
              ),
              // Caption
              showFullText
                  ? Text(
                      caption,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    )
                  : Text(
                      caption,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                      maxLines: 3, // Set the maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
