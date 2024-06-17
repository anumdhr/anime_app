import 'dart:convert';

import 'package:anime_fever/common/utils/utils.dart';
import 'package:anime_fever/config/app_config.dart';
import 'package:anime_fever/models/anime_details_model.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:http/http.dart' as http;

Future<List<AnimeModel>> getAnimeBySeasonApi({required int limit}) async {
  final year = DateTime.now().year;
  final season = getCurrentSeason();
  final baseUrl = "https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit";
  final url = Uri.parse(baseUrl);
  final response = await http.get(url, headers: {
    'X-MAL-CLIENT-ID': clientId,
  });
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final animeList = data['data'].map((data) => AnimeModel.fromJson(data)).toList();
    return animeList;
  } else {
    throw Exception("Failed to load data");
  }
}
