import 'package:flutter/material.dart';
import '../controllers/app_state.dart';

class ThemeSettingsPage extends StatelessWidget {
  final AppStateController app;
  const ThemeSettingsPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.purple,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.orange,
      Colors.pink,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Theme & Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Kid\'s name', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _NameField(app: app),
          const SizedBox(height: 24),
          Text('Theme', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.system, label: Text('System'), icon: Icon(Icons.settings_suggest)),
              ButtonSegment(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.wb_sunny)),
              ButtonSegment(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.nightlight)),
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
                  selected: app.seedColor.value == c.value,
                  onTap: () => app.setSeedColor(c),
                )
            ],
          ),
          const SizedBox(height: 24),
          Text('Layout', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Use grid on stories page'),
            value: app.useGrid,
            onChanged: (v) => app.setUseGrid(v),
            secondary: const Icon(Icons.grid_view),
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
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: 'Enter name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () {
            widget.app.setKidName(_controller.text);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Name updated to "${_controller.text}" successfully!'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: const Text('Save'),
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
              color: Colors.black.withValues(alpha: 0.1),
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
