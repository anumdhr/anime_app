import 'package:anime_fever/api/get_anime_by_search_api.dart';
import 'package:anime_fever/common/sized_box/sizedbox.dart';
import 'package:anime_fever/widget/anime_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:anime_fever/models/anime_model.dart';
import 'package:anime_fever/config/app_config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<AnimeModel> _searchResults = [];
  bool _isLoading = false;

  Future<void> _onSearchChanged() async {
    if (searchController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      List<AnimeModel> results = await getAnimeBySearchApi(query: searchController.text.trim());
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) async {
                      await _onSearchChanged();
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchController.clear();
                            _searchResults.clear();
                          });

                          // _onSearchChanged();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          child: const Icon(Icons.clear),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty
                      ? const Center(child: Text("Enter a search term"))
                      : ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final anime = _searchResults[index];
                            return AnimeListTile(anime: anime);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
