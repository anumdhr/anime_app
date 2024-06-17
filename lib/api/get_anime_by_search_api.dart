import 'dart:convert';
import 'package:anime_fever/config/app_config.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:http/http.dart' as http;

Future<List<AnimeModel>> getAnimeBySearchApi({required String query}) async {
  final baseUrl = "https://api.myanimelist.net/v2/anime?q=$query&limit=10";
  final url = Uri.parse(baseUrl);
  final response = await http.get(url, headers: {'X-MAL-CLIENT-ID': clientId});
  print(response.statusCode);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('dara $data');

    // Explicitly casting the map to a list of AnimeModel
    final List<AnimeModel> animeList = (data['data'] as List)
        .map((data) => AnimeModel.fromJson(data))
        .toList();

    print('animeList is $animeList');
    return animeList;
  } else {
    throw Exception("Failed to load data");
  }
}
