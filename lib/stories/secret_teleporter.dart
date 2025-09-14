import 'story_content.dart';

class SecretTeleporter implements StoryContent {
  @override
  final String id = 'secret_teleporter';

  @override
  final String title = 'Secret d’un téléporteur';

  @override
  final String imageAsset = 'assets/images/secret_teleporter.jpg';

  const SecretTeleporter();

  @override
  String renderBody(String kidName) {
    return '''
${kidName} n’était pas un garçon comme les autres. Alors que ses amis jouaient au foot dans le parc, lui restait souvent assis, les yeux perdus dans le ciel. Ce n’était pas qu’il n’aimait pas le foot, mais sa vie était pleine de voyages inattendus. ${kidName} avait un secret : il pouvait se téléporter.

Son pouvoir était imprévisible, comme un hoquet cosmique. Un instant, il était dans son lit, le nez dans son livre de contes, et l’instant d’après, il se retrouvait au milieu d’un marché coloré à Marrakech, entouré d’odeurs d’épices et de rires inconnus. Une fois, il a atterri sur un glacier en Antarctique, et il a fallu que ses parents le retrouvent grâce à la localisation de sa montre.

Un jour, alors qu’il était en classe, la professeure, Mme Dubois, a annoncé un cours sur les étoiles. ${kidName} a tout de suite pensé à l’observatoire, où son oncle travaillait. En fermant les yeux, il a imaginé les télescopes géants et les étoiles filantes, et l’instant d’après, il a ouvert les yeux et s’est retrouvé au milieu d’un champ de lavande, en Provence. C’était magnifique, mais ce n’était pas l’observatoire.

Frustré, ${kidName} s’est assis sur une petite butte et a regardé l’horizon. Il a essayé de se concentrer sur l’observatoire, mais son pouvoir semblait avoir une volonté propre. Il a soupiré et a dit à voix haute : "Je veux juste voir les étoiles."

À ce moment-là, une étoile filante a traversé le ciel. ${kidName} a fermé les yeux, a souhaité de tout son cœur atterrir à l’observatoire et s’est concentré plus fort que jamais. Il a visualisé les immenses dômes et les scientifiques en blouse blanche. Quand il a rouvert les yeux, il a vu la Lune, si proche qu’il aurait pu la toucher, et des milliers d’étoiles scintillantes. Il était à l’observatoire. Il avait finalement réussi à contrôler son pouvoir.

Depuis ce jour, ${kidName} a appris à maîtriser son don. Il voyageait toujours, mais cette fois, il le faisait avec intention. Il visitait les pyramides d’Égypte un matin, et la Grande Muraille de Chine l’après-midi. Il aidait aussi les gens, en transportant un chaton coincé dans un arbre jusqu’à sa maison ou en ramenant le portefeuille d’une dame qui l’avait oublié à l’autre bout de la ville.

${kidName} n’était plus un garçon qui restait assis, les yeux dans le ciel. Il était un garçon qui traversait les cieux. Et son secret, le monde entier en a bénéficié.
''';
  }
}
