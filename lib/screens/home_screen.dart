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
      appBar: const _CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.all(20.0), 
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
              decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Image(
                image: ,
              )
              )
            ),
          ]),
            ],
          )
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(context, 'For You'),
          _buildButton(context, 'Following'),
        ],
      ),
    );
  }

  TextButton _buildButton(
    BuildContext context,
    String text,
  ) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(100, 50),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
