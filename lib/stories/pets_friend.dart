import 'story_content.dart';

class PetsFriend implements StoryContent {
  @override
  final String id = 'pets_friend';

  @override
  final String title = 'L’ami des animaux';

  @override
  final String imageAsset = 'assets/images/pets_friend.jpg';

  const PetsFriend();

  @override
  String renderBody(String kidName) {
    return '''
C’était un après-midi où le soleil filtrait à travers les feuilles du grand chêne, éclairant la petite cour de sa maison. ${kidName}, était assis, les genoux remontés, et discutait avec un moineau.

« Dis-moi, Titi, qu’est-ce que tu penses du nouveau voisin ? » demanda ${kidName}.

Le moineau, sautillant d’une branche à l’autre, gazouilla : « Il a mis une statue de nain de jardin affreuse ! Et en plus, il n’a pas mis de graines pour les oiseaux. Un scandale ! »

C’était le secret de ${kidName} : il comprenait les animaux. Et ils l’adoraient. La cour de sa maison était un vrai lieu de rassemblement, avec des discussions animées entre écureuils, des débats entre fourmis, et des ragots de pigeons sur les fenêtres qu’ils avaient salies.

---

Un jour, un incident se produisit. Le chien du nouveau voisin, un grand et impressionnant berger allemand nommé Rex, se mit à aboyer sans arrêt. Le voisin, M. Martin, un homme plutôt grognon, était furieux.

« Ce chien est fou ! » s’écria M. Martin. « Je ne comprends pas ce qu’il a ! »

${kidName}, qui jouait dehors, s’approcha prudemment de la clôture. Il entendit Rex se lamenter : « J’ai perdu ma balle préférée ! La balle rouge avec la bande jaune ! Elle est tombée dans le trou, près du rosier ! »

M. Martin ne comprenait rien. Il hurlait : « Tu abois sans raison ! »

${kidName} s’éclaircit la gorge et dit timidement : « Il a perdu sa balle, monsieur. La rouge et jaune. Elle est dans le trou à côté du rosier. »

M. Martin écarquilla les yeux. Il ne l’avait pas cru, mais il jeta un coup d’œil, et effectivement, il retrouva la petite balle. Rex, tout heureux, se mit à remuer la queue. M. Martin, stupéfait, regarda ${kidName} d’un air interrogateur. « Comment tu savais ça ? »

${kidName} haussa les épaules, avec un petit sourire malicieux : « Les chiens sont pleins de secrets. Il faut juste savoir les écouter. »

---

Un peu plus tard, une véritable aventure commença. Le chat du quartier, Fifi, une petite chatte noire très élégante et un brin snob, vint voir ${kidName}.

« Mon bijou a disparu ! » pleura Fifi. « Le bijou en plumes d’oie que j’avais accroché à mon collier ! On m’a dit que c’est le grand corbeau, Boris, qui l’a pris ! Il se moque de moi ! »

${kidName} comprit que c’était plus qu’une simple conversation. Fifi voulait que ${kidName} récupère son bijou.

${kidName} se lança dans une véritable quête, interrogeant tous les animaux du quartier. Le hérisson, Piquant, lui expliqua que Boris le corbeau était un grand collectionneur d’objets brillants. Une pie bavarde, Marie-Antoinette, lui confirma que Boris avait construit son nid en haut du grand clocher de l’église, et qu’il y avait une véritable caverne aux trésors là-haut.

Avec l’aide de ses amis, les oiseaux, ${kidName} mit au point un plan astucieux. Le moineau Titi, accompagné de ses cousins, irait sur le clocher et distrairait Boris en lui racontant des histoires. Pendant ce temps, ${kidName} et ses amis s’introduiraient dans l’église pour récupérer le bijou.

Le plan se déroula à merveille. Titi et ses amis réussirent à captiver Boris avec des histoires de trésors, de graines de tournesol géantes et de pommes juteuses. ${kidName} grimpa les marches du clocher, et grâce aux indications précises de Fifi, il réussit à trouver le bijou et le rapporta à sa propriétaire.

---

Fifi, ravie, ronronna de satisfaction et promit à ${kidName} de le protéger de tous les dangers du quartier. M. Martin, le voisin, ne voyait plus ${kidName} comme un simple gamin, mais comme un ami spécial. Il lui offrait désormais des morceaux de gâteaux et des fruits qu’il laissait sur sa fenêtre pour ses amis à plumes.

Et ${kidName}, le petit garçon qui pouvait parler aux animaux, continua de vivre ses aventures, veillant sur ses amis et sur le monde autour de lui, un secret à la fois.
''';
  }
}
