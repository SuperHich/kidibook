import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../l10n/app_localizations.dart';

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
  late Future<List<Story>> _storiesFuture;

  @override
  void initState() {
    super.initState();
    _storiesFuture = loadStories();
  }

  Future<void> _refresh() async {
    setState(() {
      _storiesFuture = loadStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.app.seedColor.withValues(alpha: 0.1),
        title: SizedBox(
          height: 40,
          child: Marquee(
            text: _tabIndex == 0 ? loc.storiesFor(widget.app.kidName) : loc.favorites,
            style: Theme.of(context).textTheme.titleLarge,
            blankSpace: 50,
            velocity: 50,
            pauseAfterRound: const Duration(seconds: 2),
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
          ),
        ),
        actions: [
          IconButton(
            tooltip: loc.sortStories,
            onPressed: () {
              final current = widget.app.sortOrder;
              widget.app.setSortOrder(current == SortOrder.alphaUp ? SortOrder.alphaDown : SortOrder.alphaUp);
            },
            icon: Icon(widget.app.sortOrder == SortOrder.alphaUp ? Icons.arrow_downward : Icons.arrow_upward),
            color: Colors.blue,
          ),
          IconButton(
            tooltip: widget.app.useGrid ? loc.useList : loc.useGrid,
            onPressed: () => widget.app.setUseGrid(!widget.app.useGrid),
            icon: Icon(widget.app.useGrid ? Icons.view_list : Icons.grid_view),
            color: Colors.blue,
          ),
          IconButton(
            tooltip: loc.themeAndSettings,
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
      body: FutureBuilder<List<Story>>(
        future: _storiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(loc.error(snapshot.error.toString())),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _EmptyState(
              key: ValueKey('empty_$_tabIndex'),
              title: loc.noStoriesFound,
              subtitle: loc.pullToRefresh,
            );
          }

          final all = snapshot.data!;
          all.sort((a, b) {
            if (widget.app.sortOrder == SortOrder.alphaUp) {
              return a.title.compareTo(b.title);
            }
            return b.title.compareTo(a.title);
          });

          final favIds = widget.app.favorites;
          final favs = all.where((s) => favIds.contains(s.id)).toList();
          final list = _tabIndex == 0 ? all : favs;

          return RefreshIndicator(
            onRefresh: _refresh,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: list.isEmpty
                  ? _EmptyState(
                      key: ValueKey('empty_$_tabIndex'),
                      title: _tabIndex == 0 ? loc.noStoriesYet : loc.noFavoritesYet,
                      subtitle: _tabIndex == 0
                          ? loc.storiesWillAppearHere
                          : loc.tapHeartToFavorite,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: widget.app.useGrid
                          ? _StoriesGrid(stories: list, app: widget.app)
                          : _StoriesList(stories: list, app: widget.app),
                    ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.auto_stories_outlined), selectedIcon: const Icon(Icons.auto_stories), label: loc.all),
          NavigationDestination(icon: const Icon(Icons.favorite_border), selectedIcon: const Icon(Icons.favorite), label: loc.favorites),
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
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    
    if (isLandscape) {
      // In landscape: use dynamic height with horizontal cards
      return GridView.builder(
        itemCount: stories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns in landscape
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 3.5, // Wide aspect ratio for horizontal cards
        ),
        itemBuilder: (context, index) => _StoryCardHorizontal(story: stories[index], app: app),
      );
    } else {
      // In portrait: use original vertical card layout
      final columns = (screenSize.width ~/ 180.0).clamp(2, 3);
      return GridView.builder(
        itemCount: stories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) => _StoryCard(story: stories[index], app: app),
      );
    }
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
    final image = app.kidGender == KidGender.boy ? story.image : story.imageGirl;

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
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
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

class _StoryCardHorizontal extends StatelessWidget {
  final Story story;
  final AppStateController app;
  const _StoryCardHorizontal({required this.story, required this.app});

  @override
  Widget build(BuildContext context) {
    final isFav = app.isFavorite(story.id);
    final color = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

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
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : color.surface.withValues(alpha: 0.4),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: 'img_${story.id}',
                child: CachedNetworkImage(
                  imageUrl: story.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  // Centered title
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          story.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Favorite icon in top right
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                      color: isFav ? Colors.red : color.onSurface,
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                      onPressed: () => app.toggleFavorite(story.id),
                    ),
                  ),
                ],
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
    final loc = AppLocalizations.of(context)!;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: Hero(
        tag: 'img_${story.id}',
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: story.image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
    final loc = AppLocalizations.of(context)!;

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
