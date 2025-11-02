import 'package:flutter/foundation.dart';
import 'package:kidibook/controllers/app_state.dart';

class Story {
  final String id;
  final String title;
  final String image; // Full URL to the image for boy
  final String imageGirl; // Full URL to the image for girl
  final String bodyBoy; // Use {{name}} placeholder for kid name
  final String bodyGirl; // Use {{name}} placeholder for kid name
  final DateTime creationDate;

  const Story({
    required this.id,
    required this.title,
    required this.image,
    required this.imageGirl,
    required this.bodyBoy,
    required this.bodyGirl,
    required this.creationDate,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    const String imageBaseUrl =
        'https://raw.githubusercontent.com/SuperHich/kidibook-api/main/';
    return Story(
      id: json['id'],
      title: json['title'],
      image: imageBaseUrl + json['image'],
      imageGirl: imageBaseUrl + json['image_girl'],
      bodyBoy: json['body_boy'],
      bodyGirl: json['body_girl'],
      creationDate: json['creation_date'] != null 
          ? DateTime.parse(json['creation_date'])
          : DateTime.now(), // Fallback to current date if not provided
    );
  }

  String bodyWithName(String kidName, KidGender gender) {
    if (gender == KidGender.boy) {
      return bodyBoy.replaceAll('{{name}}', kidName);
    } else {
      return bodyGirl.replaceAll('{{name}}', kidName);
    }
  }
}

@immutable
class StoriesRepository {
  final List<Story> stories;

  const StoriesRepository(this.stories);

  Story? byId(String id) => stories.firstWhere(
        (s) => s.id == id,
        orElse: () => Story(
          id: 'not_found',
          title: 'Missing Story',
          image: 'assets/svgs/placeholder.svg',
          imageGirl: 'assets/svgs/placeholder.svg',
          bodyBoy:
              'Oops! The story could not be found. {{name}} can pick another adventure!',
          bodyGirl:
              'Oops! The story could not be found. {{name}} can pick another adventure!',
          creationDate: DateTime.now(),
        ),
      );
}
