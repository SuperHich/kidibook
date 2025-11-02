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
    final response = await http.get(Uri.parse(
        'https://cdn.jsdelivr.net/gh/SuperHich/kidibook-api@v1.0.3-1/stories/v3.json'));

    if (response.statusCode == 200) {
      await prefs.setString(_storiesCacheKey, response.body);
      final List<dynamic> jsonList = json.decode(response.body);
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
    final List<dynamic> jsonList = json.decode(cachedData);
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
