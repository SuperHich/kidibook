import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/story.dart';

Future<List<Story>> loadStories() async {
  final response = await http.get(Uri.parse('https://kidibook-api.onrender.com/stories'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Story.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load stories');
  }
}

late final StoriesRepository repository;

Future<void> initializeRepository() async {
  final stories = await loadStories();
  repository = StoriesRepository(stories);
}
