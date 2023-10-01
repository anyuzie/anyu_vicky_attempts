import 'package:flutter/material.dart';
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
  List<Post> posts = Post.posts;

  @override
  Widget build(BuildContext context) {
    Post? post = ModalRoute.of(context)!.settings.arguments as Post?;
    if (post != null) posts.insert(0, post);

    return Scaffold(
      // appBar: const _CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: posts.map((post) {
                return CustomVideoPlayer(post: post);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
