import 'package:default_project/screens/tabBox/card_screen/card_screen.dart';
import 'package:default_project/screens/tabBox/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
         const CardScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.credit_card,
              color: Colors.blue,
            ),
            icon: Icon(Icons.search),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
