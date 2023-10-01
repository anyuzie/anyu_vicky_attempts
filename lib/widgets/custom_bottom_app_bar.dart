import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../theme.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppPalette.backgroundColor,
      selectedItemColor: AppPalette.darkPurple,
      unselectedItemColor: AppPalette.darkPurple.withOpacity(0.5),
      selectedFontSize: 14,
      unselectedFontSize: 12,
      currentIndex: 0, // Set the index of the selected tab
      onTap: (index) {
        // Handle navigation when a tab is tapped
        if (index == 0) {
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
        } else if (index == 1) {
          Navigator.popAndPushNamed(context, ResourcesScreen.routeName);
        } else if (index == 2) {
          Navigator.pushNamed(context, ServicesScreen.routeName);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home', // Label for the Home tab
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Resources', // Label for the Resource tab
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Services', // Label for the Services tab
        ),
      ],
    );
  }
}
