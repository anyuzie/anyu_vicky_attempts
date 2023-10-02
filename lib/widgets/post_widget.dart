import 'package:flutter/material.dart';
import 'custom_tag.dart';

class PostWidget extends StatelessWidget {
  final String username;
  final String title;
  final String caption;
  final String avatarImagePath;
  final List<dynamic> tags;

  PostWidget({
    required this.username,
    required this.title,
    required this.caption,
    required this.avatarImagePath,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            // User Image (on the left) with padding
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatarImagePath),
                radius: 20.0,
              ),
            ),
            // Title, Username, and Caption (in a column)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Username
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Title
                  Text(
                    title,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0), // Add spacing between the user info and caption

        // Caption
        Text(
          caption,
          style: TextStyle(
            fontSize: 11.0,
            color: Colors.grey,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 10.0), // Add spacing between caption and tags

        // List of Tags
        Wrap(
          spacing: 8.0,
          children: tags.map(
            (tag) {
              if (tag is String) {
                // If it's a String, create a CustomTag with text
                return CustomTag(
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  children: [], // Pass an empty list as children
                  textTags: [tag],
                );
              } else if (tag is Widget) {
                // If it's a Widget, include it directly
                return tag;
              }
              return SizedBox.shrink(); // Return an empty container for unknown types
            },
          ).toList(),
        ),
        SizedBox(height: 20.0), // Add spacing between posts
      ],
    );
  }
}
