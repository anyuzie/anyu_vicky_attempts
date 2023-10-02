import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjust horizontal padding
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: AppPalette.topicPurple,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: AppPalette.darkPurple,  
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              )
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0), // Add spacing below the app bar
            ],
          ),
          for (var post in Post.posts)
            PostWidget(username: post.username, title: post.title, caption: post.caption, avatarImagePath: post.avatarImagePath, tags: post.tags,)
        ],
      ),
    );
  }
}
