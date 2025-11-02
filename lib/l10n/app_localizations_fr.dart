// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get kidiBook => 'KidiBook';

  @override
  String storiesFor(String kidName) {
    return 'Histoires pour $kidName';
  }

  @override
  String get favorites => 'Favoris';

  @override
  String get sortStories => 'Trier les histoires';

  @override
  String get useList => 'Vue liste';

  @override
  String get useGrid => 'Vue grille';

  @override
  String get themeAndSettings => 'Thème & Paramètres';

  @override
  String get all => 'Toutes';

  @override
  String error(String message) {
    return 'Erreur : $message';
  }

  @override
  String get noStoriesFound => 'Aucune histoire trouvée';

  @override
  String get pullToRefresh => 'Tirez pour rafraîchir.';

  @override
  String get noStoriesYet => 'Aucune histoire pour le moment';

  @override
  String get storiesWillAppearHere => 'Les histoires apparaîtront ici.';

  @override
  String get noFavoritesYet => 'Aucun favori pour le moment';

  @override
  String get tapHeartToFavorite => 'Appuyez sur le cœur d\'une histoire pour l\'ajouter aux favoris.';

  @override
  String get welcome => 'Bienvenue !';

  @override
  String get personalizeStories => 'Personnalisons les histoires. Quel est le nom de l\'enfant ?';

  @override
  String get kidsName => 'Prénom de l\'enfant';

  @override
  String get pleaseEnterName => 'Veuillez entrer un prénom';

  @override
  String get nameMinLength => 'Le prénom doit comporter au moins 2 caractères';

  @override
  String get continueButton => 'Continuer';

  @override
  String get changeNameLater => 'Vous pourrez changer le prénom plus tard dans les Paramètres.';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get themeSettings => 'Thème & Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get layout => 'Mise en page';

  @override
  String get enterName => 'Entrez le prénom';

  @override
  String nameUpdatedSuccessfully(String name) {
    return 'Prénom mis à jour vers \"$name\" avec succès !';
  }

  @override
  String get save => 'Enregistrer';

  @override
  String get kidsGender => 'Genre de l\'enfant';

  @override
  String get boy => 'Garçon';

  @override
  String get girl => 'Fille';

  @override
  String get alphaUp => 'A-Z (Titre)';

  @override
  String get alphaDown => 'Z-A (Titre)';

  @override
  String get dateNewest => 'Plus récent en premier';

  @override
  String get dateOldest => 'Plus ancien en premier';
}
