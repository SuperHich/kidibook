import 'story_content.dart';

class SkyMagic implements StoryContent {
  @override
  final String id = 'sky_magic';

  @override
  final String title = 'Le nuage Grincheux';

  @override
  final String imageAsset = 'assets/images/sky_magic.jpg';

  const SkyMagic();

  @override
  String renderBody(String kidName) {
    return '''
Il était une fois un petit garçon qui s’appelait ${kidName}. ${kidName} avait des bottes de pluie rouges toutes neuves et il n’attendait qu’une chose : sauter dans les flaques d’eau ! Mais aujourd’hui, le soleil brillait de mille feux et il n’y avait pas un seul nuage dans le ciel.

${kidName} sortit dans son jardin en traînant un peu les pieds. C’est alors qu’il le vit.

Juste au-dessus de sa tête, il y avait un tout, tout petit nuage gris. Il était si petit qu’il ressemblait à un morceau de coton oublié dans le ciel bleu. Et ce petit nuage... faisait pleuvoir. Mais seulement sur ${kidName} !

*Ploc. Ploc. Ploc.*

Des gouttes tombaient sur son nez et sur ses bottes rouges. C’était une pluie juste pour lui.

${kidName} fronça les sourcils. Il leva la tête et cria :
« Hé, pourquoi tu pleures que sur moi ? »

À sa grande surprise, une voix grave et boudeuse lui répondit :
« Parce que je suis grincheux. Et je n’ai pas eu mon goûter. »

${kidName} cligna des yeux. Un nuage qui parle ? Et qui est grincheux ? C’était la chose la plus bizarre qu’il ait jamais vue. Il réfléchit une seconde, puis une idée lumineuse germa dans sa tête. Il courut dans la cuisine et revint avec son goûter à lui : un super cookie avec des pépites de chocolat grosses comme son pouce.

« Tiens, Nuage Grincheux ! Tu peux avoir le mien ! » dit ${kidName} en tendant le cookie très haut vers le ciel.

Le petit nuage descendit un peu, tout doucement, et *slurp* ! Le cookie disparut dans la brume grise.

Pendant un instant, il ne se passa rien. Puis, le petit nuage commença à changer. Il n’était plus gris du tout ! Il devint tout rose, comme une barbe à papa. La petite pluie qui tombait sur ${kidName} s’arrêta.

Et puis, la surprise arriva.

À la place de la pluie, une nouvelle chose se mit à tomber du petit nuage rose. Ce n’était plus de l'eau... c’étaient des confettis en sucre de toutes les couleurs qui tombaient doucement sur ${kidName} et son jardin ! Ça sentait bon le sucre et la fraise.

${kidName} se mit à rire aux éclats, en essayant d’attraper les petits bonbons colorés sur sa langue. Le nuage, qui n’était plus du tout grincheux, semblait sourire en flottant joyeusement au-dessus de sa tête.

Depuis ce jour, ${kidName} avait un ami très spécial dans le ciel. Et parfois, quand il partageait son goûter avec le ciel, il recevait en retour la plus douce et la plus colorée des pluies du monde.
''';
  }
}
