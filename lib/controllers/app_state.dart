import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateController extends ChangeNotifier {
  AppStateController();

  // Persistent fields
  String _kidName = '';
  ThemeMode _themeMode = ThemeMode.system;
  int _seedColor = Colors.purple.value; // store as ARGB int
  final Set<String> _favoriteIds = <String>{};
  bool _useGrid = true;

  // Getters
  String get kidName => _kidName.isEmpty ? 'Kid' : _kidName;
  ThemeMode get themeMode => _themeMode;
  Color get seedColor => Color(_seedColor);
  Set<String> get favorites => _favoriteIds;
  bool get useGrid => _useGrid;

  // Helper: get prefs safely (prevents MissingPluginException on early web init)
  Future<SharedPreferences?> _prefsSafely() async {
    try {
      return await SharedPreferences.getInstance();
    } catch (_) {
      return null;
    }
  }

  // Initialization
  Future<void> load() async {
    final prefs = await _prefsSafely();
    if (prefs != null) {
      _kidName = prefs.getString('kid_name') ?? '';
      _themeMode = switch (prefs.getString('theme_mode')) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
      _seedColor = prefs.getInt('seed_color') ?? Colors.purple.value;
      _favoriteIds
        ..clear()
        ..addAll(prefs.getStringList('favorite_ids') ?? const <String>[]);
      _useGrid = prefs.getBool('use_grid') ?? true;
    }
    // If prefs is null, keep defaults and still notify to continue app boot
    notifyListeners();
  }

  // Name
  Future<void> setKidName(String name) async {
    _kidName = name.trim();
    final prefs = await _prefsSafely();
    if (prefs != null) {
      await prefs.setString('kid_name', _kidName);
    }
    notifyListeners();
  }

  // Theme
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await _prefsSafely();
    if (prefs != null) {
      await prefs.setString(
        'theme_mode',
        switch (mode) { ThemeMode.light => 'light', ThemeMode.dark => 'dark', _ => 'system' },
      );
    }
    notifyListeners();
  }

  Future<void> setSeedColor(Color color) async {
    _seedColor = color.value;
    final prefs = await _prefsSafely();
    if (prefs != null) {
      await prefs.setInt('seed_color', _seedColor);
    }
    notifyListeners();
  }

  // Layout toggle
  Future<void> setUseGrid(bool value) async {
    _useGrid = value;
    final prefs = await _prefsSafely();
    if (prefs != null) {
      await prefs.setBool('use_grid', _useGrid);
    }
    notifyListeners();
  }

  // Favorites
  bool isFavorite(String id) => _favoriteIds.contains(id);

  Future<void> toggleFavorite(String id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    final prefs = await _prefsSafely();
    if (prefs != null) {
      await prefs.setStringList('favorite_ids', _favoriteIds.toList());
    }
    notifyListeners();
  }
}
