import 'story_content.dart';

class CastleTwilightMystery implements StoryContent {
  @override
  final String id = 'castle_twilight_mystery';

  @override
  final String title = 'Le château au crépuscule';

  @override
  final String imageAsset = 'assets/images/castle_twilight.jpg';

  const CastleTwilightMystery();

  @override
  String renderBody(String kidName) {
    return '''
Tandis que le crépuscule peignait les nuages de framboise et de prune, ${kidName} escaladait la colline où le vieux château de pierre montait la garde en silence. Tout le monde en ville disait que le château était vide, mais si vous écoutiez bien, vous pouviez entendre le doux bruissement du velours et le tic-tac d'une horloge qui ne sonnait qu'au coucher du soleil.

À l'entrée, une lanterne s'alluma toute seule. "Bienvenue", semblait-elle dire, en se balançant le long du chemin. ${kidName} la suivit jusqu'à un grand hall où des portraits ornaient les murs : des reines aux yeux bienveillants, des rois aux bottes boueuses, des chevaliers s'appuyant sur des balais au lieu d'épées.

Un petit dragon, pas plus grand qu'un chiot, aux écailles couleur de thé, fit une apparition derrière un rideau. Il hoqueta une bouffée de cannelle. "Je m'appelle Brim", murmura-t-il. "Je garde le château bien au chaud. Mais ce soir, l'échelle de lune est coincée et les étoiles ne peuvent pas entrer."

"Où est l'échelle ?" demanda ${kidName}.

Brim le mena à travers une bibliothèque qui sentait les biscuits et les idées courageuses, puis monta un escalier qui tourbillonnait comme un coquillage, et arriva sur un toit où le ciel était si proche qu'on aurait pu le caresser. Là, appuyée contre la tour, se trouvait une échelle faite de clair de lune. Elle scintillait, mais ne voulait pas se soulever.

"Il lui faut une histoire", dit Brim. "Les vieilles échelles ne montent que pour les histoires honnêtes."

${kidName} regarda la nuit, fraîche comme une gorgée d'eau. Puis, les joues chaudes et la voix assurée, ${kidName} raconta l'histoire la plus vraie qu'il connaissait : le moment où être nouveau paraissait épineux, l'ami qui avait fait le premier signe de la main, le jour où une erreur s'était transformée en une leçon avec le sourire.

Tandis que l'histoire se déroulait, l'échelle s'illumina, chaque barreau s'emplissant d'une douce lueur. Une brise emporta les mots vers le haut jusqu'à ce que la dernière phrase se loge dans un nuage de passage. L'échelle frissonna et s'éleva, formant un doux pont pour les étoiles.

Une par une, les étoiles descendirent l'échelle sur la pointe des pieds et se blottirent dans les fenêtres du château, transformant chaque pièce en veilleuse. Les portraits semblèrent faire un clin d'œil, et quelque part, une bouilloire se mit à chanter.

Brim rayonna, de petites bouffées de fumée de cannelle écrivant « merci » dans l'air. "Pour ta vérité", dit Brim, "tu peux garder une ficelle d'étoile." Le dragon noua un minuscule fil de lumière d'étoile autour du doigt de ${kidName}. Il brillait comme la main d'un ami dans un couloir sombre.

Quand il fut temps de partir, la lanterne se balança une fois de plus, et l'horloge du hall sonna un au revoir tranquille, le genre que l'on ressent sous ses côtes. À la porte, ${kidName} se retourna. Le château brillait, brave et doux comme une promesse pour s'endormir.

Et à partir de ce moment-là, chaque fois que la soirée semblait trop grande, ${kidName} pouvait toucher la ficelle d'étoile et se souvenir : les histoires les plus vraies fabriquent des échelles ; les échelles les plus vraies apportent la lumière.
''';
  }
}
