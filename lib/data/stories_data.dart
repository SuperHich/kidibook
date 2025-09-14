import '../models/story.dart';
import '../stories/long_forest_adventure.dart';
import '../stories/castle_twilight_mystery.dart';
import '../stories/pets_friend.dart';

// Local stories with SVG images stored under assets/svgs/
final List<Story> stories = [
  const Story(
    id: 'forest_friend',
    title: 'Forest Friends',
    imageAsset: 'assets/svgs/forest.svg',
    bodyTemplate:
        'One sunny morning, {{name}} walked into the forest and met a shy fox. Together, they helped a lost bird find its nest and learned that brave hearts are kind hearts.',
  ),
  const Story(
    id: 'ocean_bubbles',
    title: 'Bubbles in the Ocean',
    imageAsset: 'assets/svgs/ocean.svg',
    bodyTemplate:
        '{{name}} dipped toes into the sparkling sea and followed a trail of bubbles. A giggly dolphin appeared, teaching {{name}} how to make the biggest bubble of laughter!',
  ),
  const Story(
    id: 'starlight_trip',
    title: 'Starlight Trip',
    imageAsset: 'assets/svgs/space.svg',
    bodyTemplate:
        'At bedtime, a star winked at {{name}}. Whoosh! A comet-car arrived and took {{name}} across the night sky to play hide-and-seek with the moon.',
  ),
  const Story(
    id: 'farm_day',
    title: 'A Day on the Farm',
    imageAsset: 'assets/svgs/farm.svg',
    bodyTemplate:
        '{{name}} visited a cozy farm where a sleepy cow needed a lullaby. With gentle humming, {{name}} and the animals made a sweet, moo-sical concert.',
  ),
  const Story(
    id: 'castle_courage',
    title: 'Castle of Courage',
    imageAsset: 'assets/svgs/castle.svg',
    bodyTemplate:
        'Behind a velvet curtain, {{name}} discovered a small castle guarded by a tiny dragon. They shared snacks, and fear turned into friendship.',
  ),
  const Story(
    id: 'friendly_alien',
    title: 'The Friendly Alien',
    imageAsset: 'assets/svgs/alien.svg',
    bodyTemplate:
        'A soft light blinked in the garden. {{name}} met Zizi, a cheerful alien who loved lemon cookies. They traded recipes and drew constellations in chalk.',
  ),
  // New long-form stories using dedicated classes
  Story(
    id: const PetsFriend().id,
    title: const PetsFriend().title,
    imageAsset: const PetsFriend().imageAsset,
    bodyTemplate: '',
    content: const PetsFriend(),
  ),
  Story(
    id: const LongForestAdventure().id,
    title: const LongForestAdventure().title,
    imageAsset: const LongForestAdventure().imageAsset,
    bodyTemplate: '',
    content: const LongForestAdventure(),
  ),
  Story(
    id: const CastleTwilightMystery().id,
    title: const CastleTwilightMystery().title,
    imageAsset: const CastleTwilightMystery().imageAsset,
    bodyTemplate: '',
    content: const CastleTwilightMystery(),
  ),
];

final repository = StoriesRepository(stories);
