import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/story.dart';

Future<List<Story>> loadStories() async {
  final response = await http.get(
    Uri.parse('https://api.jsonbin.io/v3/b/68cfe54143b1c97be94a42da'),
    headers: {
      'X-Master-Key':
          r'$2a$10$cHUzegI/Vs3lyG.ouom.4uIMYjBiC4AswTN3382LeWEP/1n0nGj7q',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> jsonList = data['record'];
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
