import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import './screens.dart';

class ResourcesScreen extends StatelessWidget {
  static const routeName = '/resources';

  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = User.users;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const _CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: MasonryGridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemCount: users.length,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          User user = users[index];
          return _UserCard(user: user, isFirstCard: index == 0);
        },
      ),
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
      backgroundColor: AppPalette.backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Guides'),
                Tab(text: 'Workshops'),
              ],
              indicatorColor: AppPalette.darkPurple,
              labelColor: AppPalette.darkPurple,
              unselectedLabelColor: AppPalette.darkPurple.withOpacity(0.5),
              onTap: (index) {
                if (index == 0) {
                  Navigator.of(context).pushNamed(GuidesScreen.routeName);
                } else if (index == 1) {
                  Navigator.of(context).pushNamed(WorkshopsScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.user,
    required this.isFirstCard,
  }) : super(key: key);

  final User user;
  final bool isFirstCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isFirstCard ? 250 : 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(user.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                stops: [0.4, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(user.imagePath)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '2 min ago',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_social_media_ui/models/category_model.dart';
// import 'package:flutter_social_media_ui/theme.dart';
// import 'package:flutter_social_media_ui/widgets/widgets.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import '../models/models.dart';
// import './screens.dart';

// class ResourcesScreen extends StatelessWidget {
//   static const routeName = '/resources';

//   const ResourcesScreen({Key? key}) : super(key: key);

//   @override

//   Widget build(BuildContext context) {
//     List<String> tabs = ['Guides', 'Workshops'];

//     return DefaultTabController(
//       initialIndex: 0,
//       length: tabs.length,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppPalette.backgroundColor,
//           elevation: 0,
//           leading: IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         bottomNavigationBar: const CustomBottomAppBar(),
//         body: ListView(
//           padding: const EdgeInsets.all(20.0),
//           children: [const _SearchBar(), _GuidesOrWorkshops(categories: categories)],
//         ),
//       ),
//     );
//   }
// }

// class _SearchBar extends StatelessWidget {
//   const _SearchBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.25,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 20),
//           TextFormField(
//             decoration: InputDecoration(
//               hintText: 'Search',
//               fillColor: AppPalette.backgroundColor,
//               filled: true,
//               prefixIcon: const Icon(
//                 Icons.search,
//                 color: Colors.grey,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _GuidesOrWorkshops extends StatelessWidget {
//   const _GuidesOrWorkshops({
//     Key? key,
//     required this.categories,
//   }) : super(key: key);

//   final List<GuideCategory> categories; // Corrected the data type

//   @override
//   Widget build(BuildContext context) {
//     List<String> tabs = categories.map((category) => category.name).toList();

//     return DefaultTabController(
//       length: tabs.length,
//       child: Column(
//         children: [
//           TabBar(
//             indicatorColor: AppPalette.darkPurple,
//             tabs: tabs
//                 .map(
//                   (tab) => Tab(
//                     text: tab,
//                   ),
//                 )
//                 .toList(),
//           ),
//           Expanded(
//             child: TabBarView(
//               children: tabs
//                   .map(
//                     (tab) => _buildTabContent(context, tab),
//                   )
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabContent(BuildContext context, String tab) {
//     final category = categories.firstWhere((category) => category.name == tab);

//     if (category != null) {
//       return _buildGuidesContent(context, category.subcategories);
//     }

//     // Return an empty container if the tab doesn't match
//     return Container();
//   }

//   Widget _buildGuidesContent(BuildContext context, List<CategoryCard> subcategories) {
//     // Build content for the "Guides" tab here
//     return ListView(
//       children: subcategories.map((subcategory) {
//         return GestureDetector(
//           onTap: () {
//             // Handle subcategory navigation
//             Navigator.pushNamed(context, subcategory.link);
//           },
//           child: Container(
//             margin: const EdgeInsets.all(8.0),
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Text(subcategory.title),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }