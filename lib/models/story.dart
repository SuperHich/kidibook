import 'package:flutter/foundation.dart';
import '../stories/story_content.dart';

class Story {
  final String id;
  final String title;
  final String imageAsset; // Local SVG asset path
  final String bodyTemplate; // Use {{name}} placeholder for kid name
  final StoryContent? content; // Optional: long-form content provider

  const Story({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.bodyTemplate,
    this.content,
  });

  String bodyWithName(String kidName) {
    if (content != null) {
      return content!.renderBody(kidName);
    }
    return bodyTemplate.replaceAll('{{name}}', kidName);
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
          imageAsset: 'assets/svgs/placeholder.svg',
          bodyTemplate:
              'Oops! The story could not be found. {{name}} can pick another adventure!',
        ),
      );
}
