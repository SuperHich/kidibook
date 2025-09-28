# KidiBook 📚

A personalized children's story app built with Flutter that delivers engaging, customizable stories for kids.

## Features ✨

### 🎨 **Personalized Experience**
- **Custom Kid Names**: Stories are personalized with your child's name
- **Dynamic Theming**: Choose from 6 beautiful color themes (Purple, Blue, Teal, Green, Orange, Pink)
- **Light/Dark Mode**: Automatic system theme support or manual selection

### 📖 **Story Management**
- **Online Story Library**: Fetches stories from a remote API with offline caching
- **Favorites System**: Mark and organize favorite stories
- **Search & Sort**: Alphabetical sorting (A-Z or Z-A)
- **Grid/List Views**: Toggle between visual grid and compact list layouts

### 📱 **Responsive Design**
- **Portrait & Landscape Support**: Optimized layouts for both orientations
- **Landscape Cards**: Horizontal story cards with square icons and titles
- **Dynamic Grid**: Responsive column counts based on screen size
- **Beautiful UI**: Material Design 3 with custom theming

### 🌍 **Internationalization**
- **Multi-language Support**: English and French localization
- **RTL Support**: Ready for right-to-left languages

### 📋 **Additional Features**
- **Copy Stories**: Copy story text to clipboard for sharing
- **Offline Mode**: Cached stories available without internet
- **Hero Animations**: Smooth transitions between screens
- **Pull-to-Refresh**: Easy story library updates

## Screenshots 📸

| Home (Portrait) | Home (Landscape) | Story Detail | Settings |
|----------------|------------------|--------------|----------|
| Grid view with story cards | Horizontal story cards | Full story with image | Theme customization |

## Getting Started 🚀

### Prerequisites
- Flutter SDK (^3.6.0)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd kidibook
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

#### Android
1. **Configure signing** (already set up):
   - Keystore file: `android/heroapps-release-key.keystore`
   - Key properties: `android/key.properties`

2. **Build APK**
   ```bash
   flutter build apk --release
   ```

3. **Build App Bundle**
   ```bash
   flutter build appbundle --release
   ```

#### iOS
```bash
flutter build ios --release
```

## Project Structure 📁

```
lib/
├── controllers/
│   └── app_state.dart          # App state management
├── data/
│   └── stories_data.dart       # Story data fetching & caching
├── l10n/                       # Localization files
│   ├── app_en.arb             # English translations
│   ├── app_fr.arb             # French translations
│   └── app_localizations.dart  # Generated localizations
├── models/
│   └── story.dart             # Story data model
├── pages/
│   ├── home_page.dart         # Main story grid/list
│   ├── story_detail_page.dart # Individual story view
│   ├── theme_settings_page.dart # Settings & theming
│   └── onboarding_name_page.dart # Initial name setup
├── theme.dart                 # App theme definitions
└── main.dart                  # App entry point
```

## Dependencies 📦

### Core
- **flutter**: UI framework
- **flutter_localizations**: Internationalization support
- **intl**: Date/number formatting

### Networking & Storage
- **http**: API requests
- **shared_preferences**: Local data persistence
- **connectivity_plus**: Network connectivity detection
- **cached_network_image**: Image caching

### UI Components
- **google_fonts**: Custom typography
- **flutter_svg**: SVG image support
- **marquee**: Scrolling text animations
- **cupertino_icons**: iOS-style icons

### Development
- **flutter_launcher_icons**: App icon generation
- **flutter_lints**: Code quality rules

## Configuration ⚙️

### API Configuration
Stories are fetched from JSONBin.io. Update the API endpoint in `lib/data/stories_data.dart`:

```dart
final response = await http.get(
  Uri.parse('https://api.jsonbin.io/v3/b/YOUR_BIN_ID'),
  headers: {'X-Master-Key': 'YOUR_API_KEY'},
);
```

### Localization
Add new languages by:
1. Creating `app_[locale].arb` files in `lib/l10n/`
2. Running `flutter gen-l10n`
3. Adding locale to `supportedLocales` in `main.dart`

### Theming
Customize colors in `lib/theme.dart` or add new theme colors in the settings page.

## Features in Detail 🔍

### Story Personalization
- Stories use `{name}` placeholders that get replaced with the child's name
- Names are stored locally and persist across app sessions

### Offline Support
- Stories are cached locally after first download
- App works without internet connection using cached data
- Automatic fallback to default stories if no cache exists

### Responsive Layout
- **Portrait**: 2-3 column grid with vertical story cards
- **Landscape**: 2 column grid with horizontal story cards
- Dynamic sizing based on screen width

### Theme System
- 6 predefined color themes
- System/Light/Dark mode support
- Colored app bars with user's selected theme color

## Contributing 🤝

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the LICENSE file for details.

## Support 💬

For support, email creative.apps.rh@gmail.com or create an issue in the repository.

---

Made with ❤️ for children and families
