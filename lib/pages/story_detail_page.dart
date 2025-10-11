import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/story.dart';

class StoryDetailPage extends StatelessWidget {
  final Story story;
  final AppStateController app;

  const StoryDetailPage({super.key, required this.story, required this.app});

  @override
  Widget build(BuildContext context) {
    final isFav = app.isFavorite(story.id);
    final loc = AppLocalizations.of(context)!;
    final image = app.kidGender == KidGender.boy ? story.image : story.imageGirl;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app.seedColor.withAlpha(0x1A),
        title: Text(story.title),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            color: isFav ? Colors.red : Colors.blue,
            onPressed: () => app.toggleFavorite(story.id),
          ),
          IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(
                  text: story.bodyWithName(app.kidName, app.kidGender)));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(loc.copiedToClipboard)));
            },
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
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                story.bodyWithName(app.kidName, app.kidGender),
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
