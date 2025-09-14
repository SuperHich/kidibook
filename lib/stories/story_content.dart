import 'package:flutter/foundation.dart';

/// Contract for rich, long-form stories that can render their text dynamically
/// based on the kid's name.
@immutable
abstract class StoryContent {
  String get id;
  String get title;
  String get imageAsset;

  /// Returns the full story text with the provided [kidName] injected.
  String renderBody(String kidName);
}
