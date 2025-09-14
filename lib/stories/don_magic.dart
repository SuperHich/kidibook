import 'story_content.dart';

class DonMagic implements StoryContent {
  @override
  final String id = 'don_magic';

  @override
  final String title = 'Le don magique';

  @override
  final String imageAsset = 'assets/images/don_magique.jpg';

  const DonMagic();

  @override
  String renderBody(String kidName) {
    return '''
${kidName} vivait dans un petit village où les toits étaient si proches qu’on pouvait presque se serrer la main d’une fenêtre à l’autre. Mais pour ${kidName}, son vrai chez-lui était sa tête. Dans sa tête, il y avait un monde plus grand que tous les océans, plus haut que toutes les montagnes. C’est que ${kidName} avait un don magique : tout ce qu’il imaginait prenait vie.

Ce n’était pas toujours facile, surtout quand il était petit. Une fois, en se brossant les dents, il a pensé à un monstre poilu et violet avec des yeux tout ronds, qui ne voulait pas sortir de la salle de bains. C’est sa maman qui a dû le faire disparaître en lui jetant un oreiller.

Mais avec le temps, ${kidName} a appris à maîtriser son pouvoir. Il a compris qu’il n’avait qu’à penser à quelque chose de très précis pour le faire apparaître, puis penser à sa disparition pour qu’il s’efface.

Un jour, le village s’ennuyait. Les enfants ne savaient plus à quoi jouer. Les parents se plaignaient que la place principale était si petite qu’on ne pouvait pas faire de courses de trottinettes. ${kidName} a fermé les yeux, a respiré profondément, et a imaginé un endroit extraordinaire.

Quand il a ouvert les yeux, la place était transformée. À la place du pavé terne, un grand parc s’étendait à perte de vue. Des arbres immenses aux branches en spirale s’élevaient vers le ciel, et des rivières de limonade pétillante coulaient entre les bancs. Les enfants se sont précipités sur un toboggan qui partait d’un nuage et arrivait directement dans une piscine à balles. Les parents ont ri en voyant des écureuils voler grâce à des parachutes minuscules que ${kidName} avait imaginés pour eux. Le parc était rempli de rires, d’odeurs de barbe à papa, et de sons de musique joyeuse.

Mais le plus drôle restait à venir. Un matin, ${kidName} était de mauvaise humeur. Il s’était disputé avec sa grande sœur. Assis au bord de la fenêtre, il a pensé à des choses vraiment bizarres.

Dans la rue, les passants ont commencé à voir des choses étranges. Une mamie a croisé un chat avec des ailes de papillon. Le boulanger a vu ses baguettes de pain se transformer en poissons rouges qui nageaient dans un seau. Et le maire, en ouvrant son parapluie, a vu une pluie de nouilles. Partout, les gens riaient, surpris par ces choses ridicules. ${kidName}, de son côté, était de plus en plus amusé. Il a fait pousser des fleurs qui sentaient les pieds, et des bottes qui sautaient toutes seules.

Finalement, ${kidName} a réalisé que son pouvoir était une immense responsabilité. Il devait en faire bon usage. Il a continué de créer des parcs, des châteaux en bonbons, des aventures extraordinaires, pour le plaisir de tous. Mais il a aussi gardé un petit coin secret dans son esprit pour ses farces personnelles, juste pour faire rire ceux qui en avaient besoin. Parce qu’un pouvoir, c’est mieux quand on peut le partager, et qu’il y a toujours une place pour un peu de magie et de fantaisie dans le quotidien.
''';
  }
}
