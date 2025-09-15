import 'story_content.dart';

class AdventureInBorderland implements StoryContent {
  @override
  final String id = 'adventure_in_borderland';

  @override
  final String title = 'Aventure au pays des merveilles';

  @override
  final String imageAsset = 'assets/images/borderland.jpg';

  const AdventureInBorderland();

  @override
  String renderBody(String kidName) {
    return '''
Il était une fois un petit garçon nommé ${kidName}. Un jour, alors qu’il se promenait dans le jardin, il vit un lapin blanc avec une montre de poche. Le lapin semblait pressé, alors ${kidName} décida de le suivre.

Il le poursuivit à travers un terrier de lapin profond, et soudain, il tomba dans un monde étrange et merveilleux. Ici, tout était différent. Les fleurs parlaient, les chats souriaient, et les horloges n’avaient pas de chiffres.

${kidName} rencontra un Chat du Cheshire mystérieux qui pouvait disparaître à volonté, et un Chapelier Fou qui organisait une fête de thé étrange. Il rétrécit et grandit de taille plusieurs fois, ce qui le rendit très confus.

Il poursuivit sa quête pour retrouver le Lapin Blanc, mais se retrouva à résoudre des énigmes et à rencontrer des personnages encore plus étranges. Finalement, il se rendit compte qu’il pouvait créer sa propre réalité dans ce pays des merveilles.

Après de nombreuses aventures folles, ${kidName} se réveilla dans son propre lit, réalisant que tout avait été un rêve. Mais il savait que le pays des merveilles était un endroit spécial où il pourrait retourner à chaque fois qu’il le souhaitait.

Et c’est ainsi que se terminent les aventures incroyables de ${kidName} au pays des merveilles, un endroit où la magie et l’imagination règnent en maîtres.
''';
  }
}
