import 'package:flutter/material.dart';
import '../global/custom_appbar.dart';
import '../global/custom_bottomnav.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNav(),
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
