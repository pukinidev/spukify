import 'package:flutter/material.dart';

import '../global/custom_appbar.dart';
import '../global/custom_bottomnav.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNav(),
      appBar: CustomAppBar(),
      body: Center(
       child: Text('Library'),
      ),
    );
  }
}
