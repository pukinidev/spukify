import 'package:flutter/material.dart';
import 'package:spukify/constants/routes.dart'; // Assuming routes is defined in this file

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _selectRoute(index);
  }

  void _selectRoute(int index) {
    final String? selectedRoute = routes[routesNav[index]];
    if (selectedRoute != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, routesNav[index], (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Colors.deepPurpleAccent,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.deepPurpleAccent,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.library_music,
            size: 30,
            color: Colors.deepPurpleAccent,
          ),
          label: 'Library',
        ),
      ],
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
