import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/story.dart';

const _storiesCacheKey = 'stories_cache';

Future<List<Story>> loadStories() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  final isConnected = connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi);
  final prefs = await SharedPreferences.getInstance();

  if (isConnected) {
    final response = await http.get(
      Uri.parse('https://api.jsonbin.io/v3/b/68ea38ea43b1c97be96291f6'),
      headers: {
        'X-Master-Key':
            r'$2a$10$cHUzegI/Vs3lyG.ouom.4uIMYjBiC4AswTN3382LeWEP/1n0nGj7q',
      },
    );

    if (response.statusCode == 200) {
      await prefs.setString(_storiesCacheKey, response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> jsonList = data['record'];
      return jsonList.map((json) => Story.fromJson(json)).toList();
    } else {
      return _loadFromCache(prefs);
    }
  } else {
    return _loadFromCache(prefs);
  }
}

Future<List<Story>> _loadFromCache(SharedPreferences prefs) async {
  final cachedData = prefs.getString(_storiesCacheKey);
  if (cachedData != null) {
    final Map<String, dynamic> data = json.decode(cachedData);
    final List<dynamic> jsonList = data['record'];
    return jsonList.map((json) => Story.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load stories from cache');
  }
}

late final StoriesRepository repository;

Future<void> initializeRepository() async {
  final stories = await loadStories();
  repository = StoriesRepository(stories);
}
