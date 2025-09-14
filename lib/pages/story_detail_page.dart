import 'package:flutter/material.dart';

import '../controllers/app_state.dart';
import '../models/story.dart';

class StoryDetailPage extends StatelessWidget {
  final Story story;
  final AppStateController app;
  const StoryDetailPage({super.key, required this.story, required this.app});

  @override
  Widget build(BuildContext context) {
    final isFav = app.isFavorite(story.id);
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            color: isFav ? Colors.red : Colors.blue,
            onPressed: () => app.toggleFavorite(story.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'img_${story.id}',
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  story.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.bodyWithName(app.kidName),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
