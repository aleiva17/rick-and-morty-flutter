import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';
import 'package:rick_and_morty_universe/character_hub/services/CharacterService.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/character_list_container.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/informative/searching_message.dart';

class SearchCharacterPage extends StatefulWidget {
  const SearchCharacterPage({super.key});

  @override
  State<SearchCharacterPage> createState() => _SearchCharacterPageState();
}

class _SearchCharacterPageState extends State<SearchCharacterPage> {
  final TextEditingController searchTermController = TextEditingController();
  CharacterService characterService = CharacterService();
  List<Character>? _characters;
  bool isSearching = false;

  void onSearch(String name) async {
    setState(() {
      isSearching = true;
    });
    _characters = await characterService.getByName(name);
    setState(() {
      _characters = _characters;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchTermController,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Search a character",
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: onSearch,
          ),
        ),
        Expanded(
          child: isSearching
              ? const SearchingMessage()
              : CharacterListContainer(characters: _characters),
        )
      ],
    );
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }
}