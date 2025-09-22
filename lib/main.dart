import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'l10n/app_localizations.dart';
import 'package:kidibook/theme.dart';
import 'controllers/app_state.dart';
import 'pages/home_page.dart';
import 'pages/onboarding_name_page.dart';
import 'data/stories_data.dart' as data;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await data.initializeRepository();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final app = AppStateController();
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    app.addListener(() => setState(() {}));
    _init();
  }

  Future<void> _init() async {
    await app.load();
    setState(() => _loaded = true);
  }

  @override
  void dispose() {
    app.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themedLight = lightTheme.copyWith(
      colorScheme: lightTheme.colorScheme.copyWith(
        primary: app.seedColor,
        inversePrimary: app.seedColor.withValues(alpha: 0.6),
      ),
    );
    final ThemeData themedDark = darkTheme.copyWith(
      colorScheme: darkTheme.colorScheme.copyWith(
        primary: app.seedColor,
        inversePrimary: app.seedColor.withValues(alpha: 0.6),
      ),
    );

    return MaterialApp(
      title: 'KidiBook',
      debugShowCheckedModeBanner: false,
      theme: themedLight,
      darkTheme: themedDark,
      themeMode: app.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (_) => !_loaded
            ? const _Splash()
            : (app.kidName.isEmpty
                ? OnboardingNamePage(controller: app)
                : HomePage(app: app)),
      },
    );
  }
}

class _Splash extends StatelessWidget {
  const _Splash();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories, size: 72, color: Colors.blue),
            const SizedBox(height: 12),
            CircularProgressIndicator(color: color.primary),
          ],
        ),
      ),
    );
  }
}
