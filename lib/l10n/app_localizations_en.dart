// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get kidiBook => 'KidiBook';

  @override
  String storiesFor(String kidName) {
    return 'Stories for $kidName';
  }

  @override
  String get favorites => 'Favorites';

  @override
  String get sortStories => 'Sort stories';

  @override
  String get useList => 'Use list';

  @override
  String get useGrid => 'Use grid';

  @override
  String get themeAndSettings => 'Theme & Settings';

  @override
  String get all => 'All';

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String get noStoriesFound => 'No stories found';

  @override
  String get pullToRefresh => 'Pull down to refresh.';

  @override
  String get noStoriesYet => 'No stories yet';

  @override
  String get storiesWillAppearHere => 'Stories will appear here.';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get tapHeartToFavorite => 'Tap the heart on a story to add it to favorites.';

  @override
  String get welcome => 'Welcome!';

  @override
  String get personalizeStories => 'Let\'s personalize the stories. What is the kid\'s name?';

  @override
  String get kidsName => 'Kid\'s name';

  @override
  String get pleaseEnterName => 'Please enter a name';

  @override
  String get nameMinLength => 'Name should be at least 2 characters';

  @override
  String get continueButton => 'Continue';

  @override
  String get changeNameLater => 'You can change the name later in Settings.';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get themeSettings => 'Theme & Settings';

  @override
  String get theme => 'Theme';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get layout => 'Layout';

  @override
  String get enterName => 'Enter name';

  @override
  String nameUpdatedSuccessfully(String name) {
    return 'Name updated to \"$name\" successfully!';
  }

  @override
  String get save => 'Save';

  @override
  String get kidsGender => 'Kid\'s gender';

  @override
  String get boy => 'Boy';

  @override
  String get girl => 'Girl';

  @override
  String get alphaUp => 'A-Z (Title)';

  @override
  String get alphaDown => 'Z-A (Title)';

  @override
  String get dateNewest => 'Newest first';

  @override
  String get dateOldest => 'Oldest first';
}
