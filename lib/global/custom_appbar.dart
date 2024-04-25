import 'package:flutter/material.dart';
import 'package:spukify/screens/auth_view/profile_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        "Home",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoBlack'),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          height: 1,
        ),
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
