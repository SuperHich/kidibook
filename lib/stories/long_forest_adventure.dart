import 'story_content.dart';

class LongForestAdventure implements StoryContent {
  @override
  final String id = 'long_forest_adventure';

  @override
  final String title = 'L’aventure de la longue forêt';

  @override
  final String imageAsset = 'assets/images/long_forest.jpg';

  const LongForestAdventure();

  @override
  String renderBody(String kidName) {
    return '''
C’était le genre de matin qui sentait les pancakes et les pins. ${kidName} serra ses lacets, glissa une petite boussole dans sa poche et fit un signe d’adieu à la fenêtre de la cuisine, qui clignait avec le soleil.

Au-delà de la barrière du jardin, la forêt s’ouvrait comme un doux rideau vert. Les feuilles murmuraient une chanson secrète et, au loin, un pic gardait un rythme régulier, « tap, tap, tap », comme si les arbres eux-mêmes avaient un cœur qui bat.

Près des pierres moussues, ${kidName} découvrit de minuscules empreintes, trop petites pour un lapin, trop soignées pour un écureuil. Curieux, ${kidName} suivit la piste, passant un tronc qui ressemblait à un dragon et un ruisseau qui riait sur les galets. Les empreintes s’arrêtèrent devant un groupe de champignons argentés.

« Bonjour ? » demanda poliment ${kidName}. Une lueur bleue apparut derrière une fougère. C’était un renard ! Mais pas n’importe quel renard : celui-ci portait une écharpe tricotée à partir du crépuscule. Le renard s’inclina. « Je suis Fenn. J’ai perdu ma clochette des carillons les plus braves. Sans elle, j’oublie d’être brave. »

${kidName} lui offrit un sourire rassurant. « Je peux t’aider. » Et la forêt sembla acquiescer.

Ensemble, ils cherchèrent sous des arches de branches et au-dessus de ponts de racines. Un hibou timide leur prêta une plume pour chatouiller le vent et écouter ses histoires. « Ta clochette a roulé vers l’étang des étoiles, » soupira le vent. « Mais l’étang ne fait écho qu’aux vérités. »

Au bord de l’étang, l’eau était si calme qu’elle retenait le ciel comme un bol. ${kidName} mit ses mains en coupe et demanda : « Où est la clochette de Fenn ? » L’étang scintilla et répondit par une question : « Que fais-tu quand tu te sens petit ? »

${kidName} pensa aux moments où le monde paraissait grand : le premier jour au terrain de jeu, la première fois dans une piscine, la première fois qu’il fallait parler devant la classe. « Je prends une grande respiration. Je pense à un visage gentil. J’essaie, même si mes genoux tremblent. »

L’étang gloussa, une ondulation argentée. « C’est vrai, » chanta-t-il, « et la vérité appelle la vérité. » Dans les roseaux, un doux tintement répondit, comme une étoile qui clignote au crépuscule. Là, enchevêtrée dans les quenouilles, pendait la clochette de Fenn.

Fenn essaya de l’atteindre, mais les roseaux le chatouillèrent et le renard poussa un petit cri d’inquiétude. ${kidName} fit un pas courageux sur la rive boueuse. « Ensemble », dit ${kidName}. Ils comptèrent, « Un, deux, trois ! » et dégagèrent délicatement la clochette.

Elle sonna, d’un son chaud et doux comme du miel, qui résonna droit dans le cœur. Fenn se tint plus droit. « Tu m’as aidé à entendre le courage, » dit le renard. « Maintenant, laisse-moi t’aider à le garder. » Fenn attacha un fin fil d’argent de la clochette autour du poignet de ${kidName}. Cela ne pesait rien, mais c’était comme tenir une promesse.

Ils retournèrent à travers la lumière verte et les chants d’oiseaux, et la forêt, enchantée, lança de petites étincelles de soleil à leurs pieds. À la barrière du jardin, Fenn s’inclina de nouveau, l’écharpe flottant comme la dernière page d’une histoire du soir.

« Souviens-toi, » dit Fenn, « le courage n’est pas bruyant. C’est la douce clochette qui sonne quand tu essaies. »

${kidName} sourit, rangeant l’aventure aux côtés des pancakes et des pins. Et si vous écoutiez attentivement ce soir-là, juste avant de vous endormir, vous pouviez entendre la clochette des carillons les plus braves sonner une fois, claire comme un souhait qui se réalise.
''';
  }
}
