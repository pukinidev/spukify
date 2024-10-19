import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spukify/models/artist.dart';

class ArtistService {
  final String _apiUrl = 'http://10.0.2.2:8080/artists';
  Future<List<Artist>> getArtists() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((artist) => Artist.fromJson(artist)).toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }
}