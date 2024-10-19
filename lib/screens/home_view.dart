import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spukify/global/custom_appbar.dart';
import 'package:spukify/global/custom_bottomnav.dart';
import '../models/artist.dart';
import '../services/music/artist_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Artist> _artists = [];

  @override
  void initState() {
    super.initState();
    _loadArtists();
  }

  // Load artists
  void _loadArtists() async {
    final artists = await ArtistService().getArtists();
    setState(() {
      _artists = artists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(),
      appBar: const CustomAppBar(),
      body: Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    Text(
                      "Top Artists 🔥",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoBlack',
                              ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: "See all",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RobotoBlack',
                              fontSize: 16,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to all artists
                          },
                      ),
                    )
                  ],

                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
    );
  }
}
