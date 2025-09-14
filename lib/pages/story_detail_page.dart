import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final Widget imageAsset;
    if(story.imageAsset.endsWith("png")) {
      imageAsset = Image.asset(
        story.imageAsset,
        fit: BoxFit.cover,
      );
    } else {
      imageAsset = SvgPicture.asset(
          story.imageAsset,
          fit: BoxFit.cover,
        );
    };

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
                child: imageAsset,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                story.bodyWithName(app.kidName),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  FilledButton.icon(
                    onPressed: () => app.toggleFavorite(story.id),
                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                    label: Text(isFav ? 'Remove Favorite' : 'Add Favorite'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () => _readAloud(context, story.bodyWithName(app.kidName)),
                    icon: const Icon(Icons.record_voice_over),
                    label: const Text('Read Aloud'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _readAloud(BuildContext context, String text) {
    // Placeholder interaction: show text in a dialog. You could integrate TTS later.
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Read Aloud'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(c).pop(),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
