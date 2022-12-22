import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../homePage.dart';

class CustomBottomBar extends StatefulWidget {
  GlobalKey<ScaffoldState> globalKey;
  CustomBottomBar({super.key, required this.globalKey});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _currentIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.search_outlined,
    Icons.menu_rounded
  ];
  // GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: const Color(0xff19245D),
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      icons: iconList,
      activeIndex: _currentIndex,
      gapLocation: GapLocation.none,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        setState(() => _currentIndex = index);
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
        if (index == 2) {
          widget.globalKey.currentState?.openDrawer();
        }
      },
      //other params
    );
  }
}
