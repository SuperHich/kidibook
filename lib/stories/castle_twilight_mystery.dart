import 'story_content.dart';

class CastleTwilightMystery implements StoryContent {
  @override
  final String id = 'castle_twilight_mystery';

  @override
  final String title = 'The Castle at Twilight';

  @override
  final String imageAsset = 'assets/svgs/castle.svg';

  const CastleTwilightMystery();

  @override
  String renderBody(String kidName) {
    return '''
Twilight painted the clouds with raspberry and plum as ${kidName} climbed the hill where the old stone castle kept quiet watch. Everyone in town said the castle was empty, but if you listened just right, you could hear the soft swish of velvet and a clock that ticked only at sunset.

At the gate, a lantern flickered to life by itself. “Welcome,” it seemed to say, bobbing along the path. ${kidName} followed to a grand hall where portraits lined the walls—queens with kind eyes, kings with muddy boots, knights leaning on broomsticks instead of swords.

A small dragon peeked from behind a curtain—a dragon no bigger than a puppy, with scales like tea leaves. It hiccuped a puff of cinnamon. “I’m Brim,” it whispered. “I keep the castle cozy. But tonight the moon ladder is stuck, and the stars can’t come in.”

“Where is the ladder?” asked ${kidName}.

Brim led the way through a library that smelled like biscuits and brave ideas, up a staircase that spiraled like a seashell, and onto a rooftop where the sky felt close enough to pet. There, leaning against the tower, was a ladder made of moonlight. It glittered but wouldn’t lift.

“It needs a story,” Brim said. “Old ladders only climb for honest stories.”

${kidName} looked at the night, cool as a sip of water. Then, with cheeks warm and voice steady, ${kidName} told the truest story they knew: about the time being new felt prickly, about the friend who waved first, about the day a mistake turned into a lesson wearing a smile.

As the story unfurled, the ladder brightened, each rung filling with a soft glow. A breeze carried the words upward until the last sentence tucked itself into a passing cloud. The ladder shivered and rose, making a gentle bridge for the stars.

One by one, stars tiptoed down the ladder and nestled into the castle windows, turning every room into a nightlight. The portraits seemed to wink, and somewhere a kettle began to sing.

Brim beamed, little curls of cinnamon smoke spelling thank you in the air. “For your truth,” Brim said, “you may keep a star-string.” The dragon tied a tiny thread of starlight around ${kidName}'s finger. It glowed like a friend’s hand in a dark hallway.

When it was time to go, the lantern bobbed along once more, and the clock in the hall ticked a quiet goodbye, the kind you feel under your ribs. At the gate, ${kidName} looked back. The castle glowed, brave and gentle as a bedtime promise.

And from then on, whenever the evening felt too big, ${kidName} could touch the star-string and remember: the truest stories make ladders; the truest ladders bring light.
''';
  }
}
