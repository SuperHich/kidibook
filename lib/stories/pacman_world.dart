import 'story_content.dart';

class PacmanWorld implements StoryContent {
  @override
  final String id = 'pacman_world';

  @override
  final String title = 'Le monde de Pacman';

  @override
  final String imageAsset = 'assets/images/pacman_world.jpg';

  const PacmanWorld();

  @override
  String renderBody(String kidName) {
    return '''
Il était une fois, dans un petit village animé, un jeune garçon nommé ${kidName}. ${kidName} était un fan inconditionnel de jeux vidéo, et son préféré était Pac-Man. Il rêvait de rencontrer Pac-Man en personne et de vivre une aventure avec lui.

Un soir, alors que ${kidName} jouait à Pac-Man sur sa console, quelque chose d’incroyable se produisit. L’écran de la télévision scintilla, et une lumière vive en jaillit. ${kidName} ferma les yeux, et quand il les rouvrit, il se retrouva dans un monde étrange, fait de murs bleus et de points jaunes. C’était le monde de Pac-Man !

Devant lui, Pac-Man lui-même, grand et souriant, l’attendait. "Bonjour ${kidName} !" dit Pac-Man d’une voix joyeuse. "J’ai besoin de ton aide. Les fantômes ont volé tous les super-gommes du labyrinthe, et sans elles, je ne peux pas les arrêter !"

${kidName} était stupéfait mais ravi. "Bien sûr, Pac-Man ! Je vais t’aider !"

Ainsi commença leur aventure. ${kidName} et Pac-Man traversèrent des labyrinthes complexes, évitant les fantômes Blinky, Pinky, Inky et Clyde. ${kidName}, avec son agilité et sa connaissance du jeu, aidait Pac-Man à trouver les chemins les plus sûrs et à collecter les points jaunes.

Ils rencontrèrent de nombreux défis. Un jour, ils se retrouvèrent bloqués devant un mur de briques. "Comment allons-nous passer ?" demanda ${kidName}. Pac-Man eut une idée. Il se mit à manger les briques une par une, créant un passage.

Un autre jour, ils furent encerclés par les fantômes. ${kidName} se rappela que les super-gommes rendaient Pac-Man invincible. Il repéra une super-gomme cachée derrière un pilier et cria : "Pac-Man, par ici !". Pac-Man la mangea, et les fantômes, terrifiés, s’enfuirent.

Finalement, après de nombreuses péripéties, ils atteignirent le repaire des fantômes. Là, ils trouvèrent toutes les super-gommes, gardées par un fantôme géant. ${kidName} et Pac-Man travaillèrent ensemble. ${kidName} distraya le fantôme géant pendant que Pac-Man mangeait toutes les super-gommes.

Une fois les super-gommes récupérées, le monde de Pac-Man commença à scintiller à nouveau. Pac-Man sourit à ${kidName}. "Merci, mon ami. Tu as sauvé notre monde."

${kidName} se retrouva dans son salon, devant sa télévision. Le jeu était terminé, et Pac-Man avait gagné. ${kidName} savait que ce n’était pas un rêve. Il avait vécu une véritable aventure avec son héros. Depuis ce jour, ${kidName} a toujours gardé un souvenir précieux de son incroyable aventure avec Pac-Man, une histoire qu’il raconterait encore et encore.
''';
  }
}
