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
  // List<Post> posts = Post.posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  fillColor: Colors.purple.shade200,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.purple,  
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
              const SizedBox(height: 20.0), // Add spacing between search bar and posts
              ListView(
                children: [
                  
                ]
              )
            ],
          ),
        ],
      )
    );
  }
}

