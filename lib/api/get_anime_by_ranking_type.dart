import 'dart:convert';

import 'package:anime_fever/config/app_config.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RankedAnimeRepo {
  Future<List<AnimeModel>> getRankedAnime({required String rankingType, required int limit}) async {
    final baseUrl = "https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit";
    final url = Uri.parse(baseUrl);
    final response = await http.get(url, headers: {'X-MAL-CLIENT-ID': clientId});
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> animeList = data['data'] as List;
      final anime = animeList.where((animeList) => animeList['node']['main_picture'] != null).map((e) => AnimeModel.fromJson(e)).toList();
      return anime;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
