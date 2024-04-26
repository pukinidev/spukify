import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Home",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoBlack'),
      ),
      actions: appBarActions(context),
      backgroundColor: Colors.transparent,
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
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
        ),
      ];
    }
}
