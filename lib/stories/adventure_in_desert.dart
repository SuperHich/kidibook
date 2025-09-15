import 'story_content.dart';

class AdventureInDesert implements StoryContent {
  @override
  final String id = 'adventure_in_desert';

  @override
  final String title = 'Aventure dans le désert';

  @override
  final String imageAsset = 'assets/images/desert.jpg';

  const AdventureInDesert();

  @override
  String renderBody(String kidName) {
    return '''
${kidName} était un petit garçon curieux, avec des yeux étincelants de fascination pour le désert. Un matin, sa famille, composée de son papa, de sa maman et de sa chère grande-mère, décida de partir à l’aventure dans le sud tunisien.

Ils chargèrent leur 4x4 en préparant tout ce dont ils avaient besoin pour leur voyage. Le petit garçon était impatient et sautillait d’excitation. "Je veux voir les dunes de sable géantes !" s’écria-t-il. Sa maman sourit et dit : "Nous les verrons, mon chéri, mais n’oublie pas de rester près de nous."

Leur voyage les emmena à travers des paysages arides et magnifiques. ${kidName} écoutait avec attention les histoires de sa grande-mère sur les anciennes tribus nomades qui avaient habité ces terres. Il était fasciné par les récits de sa grand-mère.

Après quelques heures de route, ils atteignirent enfin les dunes de sable doré. ${kidName} sauta hors de la voiture et se mit à courir dans les dunes, sa famille le suivant de près. Ils s’amusèrent à grimper au sommet des dunes, à glisser sur le sable et à observer les traces laissées par les animaux du désert.

Le soir venu, ils dressèrent leur campement sous un ciel étoilé scintillant. Ils partagèrent un délicieux repas préparé par maman et écoutèrent les chants berbères de sa grande-mère autour du feu de camp.

${kidName} s’endormit cette nuit-là avec le sourire, comblé par les aventures de la journée et par l’amour de sa famille. C’était un voyage qu’il n’oublierait jamais, dans le magnifique désert du sud tunisien, avec son papa, sa maman et sa grande-mère à ses côtés.
''';
  }
}
