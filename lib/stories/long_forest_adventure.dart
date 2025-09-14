import 'story_content.dart';

class LongForestAdventure implements StoryContent {
  @override
  final String id = 'long_forest_adventure';

  @override
  final String title = 'The Long Forest Adventure';

  @override
  final String imageAsset = 'assets/svgs/forest.svg';

  const LongForestAdventure();

  @override
  String renderBody(String kidName) {
    return '''
It was the kind of morning that smelled like pancakes and pine trees. ${kidName} tied their shoelaces tight, tucked a tiny compass in a pocket, and waved goodbye to the kitchen window that winked with sun.

Beyond the garden gate, the forest began like a soft green curtain. Leaves whispered a secret song, and somewhere far away, a woodpecker kept a steady drumbeat—tap, tap, tap—as if the trees themselves had a heartbeat.

Near the mossy stones, ${kidName} discovered tiny footprints—too small for a rabbit, too tidy for a squirrel. Curious, ${kidName} followed the trail past a log that looked like a dragon and a stream that laughed over pebbles. The footprints stopped at a patch of silver mushrooms.

“Hello?” ${kidName} asked politely. A flicker of blue peeked from behind a fern. It was a fox! But not just any fox—this one wore a scarf knit from twilight. The fox bowed. “I’m Fenn. I lost my bell of bravest chimes. Without it, I forget to be brave.”

${kidName} offered a steady smile. “I can help.” And the forest seemed to nod in agreement.

Together, they searched under archways of branches and over bridges of roots. A shy owl lent them a feather to tickle the wind and listen to its stories. “Your bell rolled toward the Starlight Pond,” the wind sighed. “But the pond only echoes truths.”

At the pond, the water was so still it held the sky like a bowl. ${kidName} cupped their hands and asked, “Where is Fenn’s bell?” The pond shimmered and answered with a question of its own: “What do you do when you feel small?”

${kidName} thought of times when the world felt big: the first day at the playground, the first swim in the pool, the first time speaking in front of the class. “I take a breath. I remember a kind face. I try, even if my knees knock.”

The pond giggled a silver ripple. “True,” it sang, “and truth calls to truth.” From the reeds, a soft chime answered like a star blinking at dusk. There, tangled in cattails, hung Fenn’s bell.

Fenn tried to reach, but the reeds tickled and the fox squeaked with worry. ${kidName} took a brave step onto the squishy bank. “Together,” said ${kidName}. They counted, “One, two, three!” and gingerly freed the bell.

It rang—a warm, honey-sweet sound that chimed straight into the heart. Fenn stood taller. “You helped me hear courage,” the fox said. “Now let me help you keep it.” Fenn tied a thin silver thread from the bell around ${kidName}'s wrist. It didn’t weigh a thing, but it felt like holding hands with a promise.

They walked back through green light and birdsong, and the forest, delighted, tossed little sparkles of sunlight at their feet. At the garden gate, Fenn bowed again, scarf fluttering like a bedtime story’s last page.

“Remember,” said Fenn, “courage isn’t loud. It’s the soft bell that rings when you try.”

${kidName} smiled, tucking the adventure beside the pancakes and pine trees. And if you listened closely that evening, just before sleep, you could hear the bell of bravest chimes ring once—bright as a wish coming true.
''';
  }
}
