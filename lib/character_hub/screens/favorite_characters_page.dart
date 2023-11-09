import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';
import 'package:rick_and_morty_universe/character_hub/persistence/repositories/character_repository.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/character_card.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/informative/no_favorite_characters_message.dart';

class FavoriteCharactersPage extends StatefulWidget {
  const FavoriteCharactersPage({super.key});

  @override
  State<FavoriteCharactersPage> createState() => _FavoriteCharactersPageState();
}

class _FavoriteCharactersPageState extends State<FavoriteCharactersPage> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character> characters = [];

  @override
  initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    final favoriteCharacters = await characterRepository.getAll() ?? [];

    if (mounted) {
      setState(() {
        characters = favoriteCharacters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return const NoFavoriteCharactersMessage();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Favorite characters (${characters.length}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...characters.map(
                  (character) => CharacterCard(character: character)
          ).toList()
        ],
      ),
    );
  }
}