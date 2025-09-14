import 'package:flutter/material.dart';

import '../controllers/app_state.dart';
import '../data/stories_data.dart';
import '../models/story.dart';
import 'story_detail_page.dart';
import 'theme_settings_page.dart';

class HomePage extends StatefulWidget {
  final AppStateController app;
  const HomePage({super.key, required this.app});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0; // 0: All, 1: Favorites

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final List<Story> all = repository.stories;
    final Set<String> favIds = widget.app.favorites;
    final List<Story> favs = all.where((s) => favIds.contains(s.id)).toList();

    final List<Story> list = _tabIndex == 0 ? all : favs;

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabIndex == 0 ? 'Stories for ${widget.app.kidName}' : 'Favorites'),
        actions: [
          IconButton(
            tooltip: widget.app.useGrid ? 'Use list' : 'Use grid',
            onPressed: () => widget.app.setUseGrid(!widget.app.useGrid),
            icon: Icon(widget.app.useGrid ? Icons.view_list : Icons.grid_view),
            color: Colors.blue,
          ),
          IconButton(
            tooltip: 'Theme & Settings',
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ThemeSettingsPage(app: widget.app),
                ),
              );
              setState(() {});
            },
            icon: const Icon(Icons.settings),
            color: Colors.blue,
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: list.isEmpty
            ? _EmptyState(
                key: ValueKey('empty_$_tabIndex'),
                title: _tabIndex == 0 ? 'No stories yet' : 'No favorites yet',
                subtitle: _tabIndex == 0
                    ? 'Stories will appear here.'
                    : 'Tap the heart on a story to add it to favorites.',
              )
            : Padding(
                padding: const EdgeInsets.all(12),
                child: widget.app.useGrid
                    ? _StoriesGrid(stories: list, app: widget.app)
                    : _StoriesList(stories: list, app: widget.app),
              ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.auto_stories_outlined), selectedIcon: Icon(Icons.auto_stories), label: 'All'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}

class _StoriesGrid extends StatelessWidget {
  final List<Story> stories;
  final AppStateController app;
  const _StoriesGrid({required this.stories, required this.app});

  @override
  Widget build(BuildContext context) {
    final columns = MediaQuery.of(context).size.width ~/ 180.0;
    return GridView.builder(
      itemCount: stories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns.clamp(2, 4),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) => _StoryCard(story: stories[index], app: app),
    );
  }
}

class _StoriesList extends StatelessWidget {
  final List<Story> stories;
  final AppStateController app;
  const _StoriesList({required this.stories, required this.app});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: stories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => _StoryTile(story: stories[index], app: app),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final Story story;
  final AppStateController app;
  const _StoryCard({required this.story, required this.app});

  @override
  Widget build(BuildContext context) {
    final isFav = app.isFavorite(story.id);
    final color = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoryDetailPage(story: story, app: app),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: 'img_${story.id}',
                      child: Image.asset(
                        story.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                      color: isFav ? Colors.red : color.onSurface,
                      onPressed: () => app.toggleFavorite(story.id),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                story.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryTile extends StatelessWidget {
  final Story story;
  final AppStateController app;
  const _StoryTile({required this.story, required this.app});

  @override
  Widget build(BuildContext context) {
    final isFav = app.isFavorite(story.id);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Hero(
        tag: 'img_${story.id}',
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              story.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(story.title),
      trailing: IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        color: isFav ? Colors.red : Colors.blue,
        onPressed: () => app.toggleFavorite(story.id),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoryDetailPage(story: story, app: app),
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  const _EmptyState({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories, size: 64, color: Colors.blue),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
