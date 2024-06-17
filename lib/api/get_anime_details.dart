import 'dart:convert';

import 'package:anime_fever/config/app_config.dart';
import 'package:anime_fever/models/anime_details_model.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:http/http.dart' as http;

Future<AnimeDetailsModel> getAnimeDetails({required int id}) async {
  final baseUrl =
      "https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics";
  final url = Uri.parse(baseUrl);
  final response = await http.get(url, headers: {'X-MAL-CLIENT-ID': clientId});
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final animeList = AnimeDetailsModel.fromJson(data);
    return animeList;
  } else {
    throw Exception("Failed to load data");
  }
}
