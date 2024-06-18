import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(
        routeName(ModalRoute.of(context)!.settings.name!),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoBlack'),
      ),
      actions: appBarActions(context),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

List<Widget> appBarActions(BuildContext context) {
    if(ModalRoute.of(context)!.settings.name == '/profile') {
      return [];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.deepPurpleAccent,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
        ),
      ];
    }
}

Map<String, String> routes = {
  '/home': 'Home',
  '/profile': 'Profile',
};

String routeName(String route) {
  String name = '';
  routes.forEach((key, value) {
    if (key == route) {
      name = value;
    }
  });
  return name;
}
