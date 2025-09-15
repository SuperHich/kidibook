import 'story_content.dart';

class VisitNewYork implements StoryContent {
  @override
  final String id = 'visit_new_york';

  @override
  final String title = 'Visite à New York';

  @override
  final String imageAsset = 'assets/images/new_york.jpg';

  const VisitNewYork();

  @override
  String renderBody(String kidName) {
    return '''
Il était une fois, à New York, un petit garçon nommé ${kidName}. Il était accompagné de son papa et de sa maman. Un jour ensoleillé, ils décidèrent de partir à l’aventure dans la grande ville.

Ils commencèrent par se rendre à Central Park, où ${kidName} découvrit un étang rempli de canards. Il demanda à ses parents s’ils pouvaient acheter du pain pour nourrir les canards, ce à quoi ils acquiescèrent avec un sourire. Les canards se rassemblèrent autour d’eux, créant un moment de joie pour la famille.

Ensuite, ils se dirigèrent vers Times Square, où les lumières vives et les écrans géants éblouirent ${kidName}. Il ne savait pas où regarder en premier. Ses parents le prirent en photo sous les lumières scintillantes, créant ainsi des souvenirs précieux.

Le lendemain, ils visitèrent le Musée d’Histoire Naturelle, où ${kidName} fut fasciné par les squelettes de dinosaures et les expositions sur les animaux. Il posa de nombreuses questions, et ses parents étaient heureux de répondre à sa curiosité.

Chaque jour à New York était une nouvelle aventure pour ${kidName}, et il était reconnaissant d’avoir ses parents à ses côtés pour partager ces moments spéciaux. Ils créèrent des souvenirs inoubliables dans la ville qui ne dort jamais, renforçant ainsi leur lien familial.
''';
  }
}
