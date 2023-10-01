import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  final String username;
  final String title;
  final String caption;

  MyPost({
    required this.username,
    required this.title,
    required this.caption,
  });

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // User Image (on the left) with padding
          Padding(
            padding: EdgeInsets.only(right: 8.0), // Adjust the padding as needed
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatars/30.png'),
              radius: 20.0, // Adjust the radius as needed
            ),
          ),

          // Title, Username, and Caption (in a column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Username
              Text(
                widget.username,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Title
              Text(
                widget.title,
                style: TextStyle(fontSize: 24.0),
              ),

              // Caption
              showFullText
                  ? Text(
                      widget.caption,
                      style: TextStyle(
                        fontSize: 14.0, // Adjust the font size as needed
                        color: Colors.grey, // Adjust the color as needed
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        Text(
                          widget.caption,
                          style: TextStyle(
                            fontSize: 14.0, // Adjust the font size as needed
                            color: Colors.grey, // Adjust the color as needed
                          ),
                          maxLines: 3, // Set the maximum number of lines
                          overflow: TextOverflow.ellipsis, // Add overflow ellipsis
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showFullText = true;
                            });
                          },
                          child: Text(
                            "More",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
