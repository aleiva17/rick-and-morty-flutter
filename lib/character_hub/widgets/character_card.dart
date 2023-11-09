import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';
import 'package:rick_and_morty_universe/character_hub/persistence/repositories/character_repository.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/character_detail.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  CharacterRepository characterRepository = CharacterRepository();
  late Character character;
  bool isFavorite = false;

  @override
  initState() {
    character = widget.character;
    initialize();
    super.initState();
  }

  initialize() async {
    final exist = await characterRepository.existById(character.id);

    if (mounted) {
      setState(() {
        isFavorite = exist;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final characterImage = Image.network(character.image);

    void handleToggleFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
      isFavorite
          ? characterRepository.insert(character)
          : characterRepository.delete(character);
    }

    void handleTapOnCard() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetail(character: character)
          )
      );
    }

    return GestureDetector(
      onTap: handleTapOnCard,
      child: Card(
        child: ListTile(
          leading: characterImage,
          title: Text(character.name),
          subtitle: Text(character.species),
          trailing: IconButton(
            onPressed: handleToggleFavorite,
            icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border
            ),
          ),
        ),
      ),
    );
  }
}
