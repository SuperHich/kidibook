import '../models/story.dart';
import '../stories/castle_twilight_mystery.dart';
import '../stories/don_magic.dart';
import '../stories/long_forest_adventure.dart';
import '../stories/pacman_world.dart';
import '../stories/pets_friend.dart';
import '../stories/secret_teleporter.dart';
import '../stories/sky_magic.dart';

// Local stories with SVG images stored under assets/svgs/
final List<Story> stories = [
  // New long-form stories using dedicated classes
  Story(
    id: const PetsFriend().id,
    title: const PetsFriend().title,
    imageAsset: const PetsFriend().imageAsset,
    bodyTemplate: '',
    content: const PetsFriend(),
  ),
  Story(
    id: const DonMagic().id,
    title: const DonMagic().title,
    imageAsset: const DonMagic().imageAsset,
    bodyTemplate: '',
    content: const DonMagic(),
  ),
  Story(
    id: const SecretTeleporter().id,
    title: const SecretTeleporter().title,
    imageAsset: const SecretTeleporter().imageAsset,
    bodyTemplate: '',
    content: const SecretTeleporter(),
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
  Story(
    id: const SkyMagic().id,
    title: const SkyMagic().title,
    imageAsset: const SkyMagic().imageAsset,
    bodyTemplate: '',
    content: const SkyMagic(),
  ),
  Story(
    id: const PacmanWorld().id,
    title: const PacmanWorld().title,
    imageAsset: const PacmanWorld().imageAsset,
    bodyTemplate: '',
    content: const PacmanWorld(),
  ),
];

final repository = StoriesRepository(stories);
