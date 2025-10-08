import 'package:flutter/material.dart';

import '../controllers/app_state.dart';
import '../l10n/app_localizations.dart';

class ThemeSettingsPage extends StatelessWidget {
  final AppStateController app;
  const ThemeSettingsPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colors = [
      Colors.purple,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.orange,
      Colors.pink,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app.seedColor.withAlpha(25),
        title: Text(loc.themeSettings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(loc.kidsName, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _NameField(app: app),
          const SizedBox(height: 24),
          Text(loc.kidsGender, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<KidGender>(
            segments: [
              ButtonSegment(value: KidGender.boy, label: Text(loc.boy, maxLines: 1), icon: const Icon(Icons.male)),
              ButtonSegment(value: KidGender.girl, label: Text(loc.girl, maxLines: 1), icon: const Icon(Icons.female)),
            ],
            selected: {app.kidGender},
            onSelectionChanged: (set) => app.setKidGender(set.first),
          ),
          const SizedBox(height: 24),
          Text(loc.theme, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(value: ThemeMode.system, label: Text(loc.system, maxLines: 1), icon: const Icon(Icons.settings_suggest)),
              ButtonSegment(value: ThemeMode.light, label: Text(loc.light, maxLines: 1), icon: const Icon(Icons.wb_sunny)),
              ButtonSegment(value: ThemeMode.dark, label: Text(loc.dark, maxLines: 1), icon: const Icon(Icons.nightlight)),
            ],
            selected: {app.themeMode},
            onSelectionChanged: (set) => app.setThemeMode(set.first),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final c in colors)
                _ColorChoice(
                  color: c,
                  selected: app.seedColor.toARGB32() == c.toARGB32(),
                  onTap: () => app.setSeedColor(c),
                )
            ],
          ),
        ],
      ),
    );
  }
}

class _NameField extends StatefulWidget {
  final AppStateController app;
  const _NameField({required this.app});

  @override
  State<_NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<_NameField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.app.kidName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.words,
            onEditingComplete: () {
              widget.app.setKidName(_controller.text);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loc.nameUpdatedSuccessfully(_controller.text)),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            decoration: InputDecoration(
              hintText: loc.enterName,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorChoice extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  const _ColorChoice({required this.color, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
          border: Border.all(color: selected ? Colors.white : Colors.transparent, width: 3),
        ),
        child: selected
            ? const Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}
