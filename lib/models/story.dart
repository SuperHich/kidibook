import 'package:flutter/foundation.dart';

class Story {
  final String id;
  final String title;
  final String image; // Full URL to the image
  final String body; // Use {{name}} placeholder for kid name

  const Story({
    required this.id,
    required this.title,
    required this.image,
    required this.body,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    const String imageBaseUrl = 'https://raw.githubusercontent.com/SuperHich/kidibook-api/main/';
    return Story(
      id: json['id'],
      title: json['title'],
      image: imageBaseUrl + json['image'],
      body: json['body'],
    );
  }

  String bodyWithName(String kidName) {
    return body.replaceAll('{{name}}', kidName);
  }
}

@immutable
class StoriesRepository {
  final List<Story> stories;
  const StoriesRepository(this.stories);

  Story? byId(String id) => stories.firstWhere(
        (s) => s.id == id,
        orElse: () => const Story(
          id: 'not_found',
          title: 'Missing Story',
          image: 'assets/svgs/placeholder.svg',
          body:
              'Oops! The story could not be found. {{name}} can pick another adventure!',
        ),
      );
}
