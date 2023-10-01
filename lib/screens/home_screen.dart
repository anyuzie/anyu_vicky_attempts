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
              Row(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Username
                    Text(
                      "handymandy",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Title
                    Text(
                      "First time caregiver tips",
                      style: TextStyle(fontSize: 24.0),
                    ),

                    // Caption
                    Text(
                    "I’m overwhelmed because I feel like I’m doing everything wrong. My main priority is to make sure my mother is totally comfortable and pain-free while she is in her transition phase. I feel guilty when she’s sleeping comfortably and I have to move her to get her cleaned up or shift her position to prevent sores, and she weeps in pain. It’s the toughest part about all this. I love caring for her because I love her, I’m so busy with things that I have become somewhat disassociated (I still cry but I know I haven’t processed things fully yet) and when all this is over, on top of all the other bad feelings, I deeply fear the guilt I’ll have for causing her that pain. I truly feel seeing her decline is traumatizing me. If anyone could offer some helpful tips, I would be very grateful.",
                    style: TextStyle(
                      fontSize: 14.0, // Adjust the font size as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    maxLines: 3, // Set the maximum number of lines
                    overflow: TextOverflow.ellipsis, // Add overflow ellipsis
                  ),
      ],
    ),
  ),
],

              ),
            ],
          ),
        ],
      )
    );
  }
}

