import 'story_content.dart';

class AdventureInMountain implements StoryContent {
  @override
  final String id = 'adventure_in_mountain';

  @override
  final String title = 'Aventure à la montagne';

  @override
  final String imageAsset = 'assets/images/mountain.jpg';

  const AdventureInMountain();

  @override
  String renderBody(String kidName) {
    return '''
${kidName}, un petit garçon qui a toujours rêvé de faire du ski, mais n’en a jamais eu l’occasion. Un jour, ses parents lui ont annoncé qu’ils partaient en vacances à la montagne. ${kidName} était aux anges !

Ils sont arrivés à la station de ski le matin. ${kidName} a été émerveillé par la beauté des montagnes enneigées. Il a rapidement enfilé son équipement et est parti à l’assaut des pistes.

Au début, ${kidName} était un peu hésitant. Il avait peur de tomber. Mais ses parents étaient là pour l’encourager. Ils lui ont appris à maîtriser ses skis et à se déplacer sur les pistes.

---

Au fur et à mesure, ${kidName} a pris confiance en lui. Il a commencé à dévaler les pistes de plus en plus vite et s’amusait comme un fou !

Un jour, ${kidName} a décidé de s’aventurer sur une piste plus difficile. Il a pris de la vitesse et a dévalé la pente à toute allure. Il a failli tomber, mais il s’est rattrapé de justesse.

${kidName} était très fier de lui. Il avait réussi à faire quelque chose qu’il n’aurait jamais cru possible.

Il a passé une semaine inoubliable à la montagne. Il a appris à skier, s’est fait de nouveaux amis et a vécu de grandes aventures.

Le jour du départ, ${kidName} était triste de quitter la montagne, mais il savait qu’il y reviendrait un jour.
''';
  }
}
