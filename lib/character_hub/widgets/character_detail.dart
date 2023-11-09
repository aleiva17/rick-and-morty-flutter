import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: PhysicalModel(
                color: Colors.transparent,
                elevation: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(character.image),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              character.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text(character.species,),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  side: const BorderSide(color: Colors.transparent),
                ),
                const SizedBox(width: 8,),
                GenderChip(gender: character.gender,)
              ],
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: "Status: ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: character.status,
                    style: TextStyle(
                        color: character.status == "Alive"
                            ? Colors.green
                            : character.status == "Dead"
                              ? Colors.red
                              : Colors.orange
                    )
                  )
                ]
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "Location info",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Chip(
                    label: Text(
                        "Origin: ${character.originName}"
                    )
                ),
                Chip(
                    label: Text(
                        "Actual: ${character.currentLocationName}"
                    )
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: 140,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                Text('Go back')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderChip extends StatelessWidget {
  final String gender;
  const GenderChip({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    Color genderColor = Colors.yellow;
    Icon genderIcon = const Icon(Icons.question_mark);

    // I know that a color has no gender, it's just for practice.
    if (gender == "Male") {
      genderColor = Colors.blue;
      genderIcon = const Icon(Icons.male, color: Colors.white);
    }
    else if (gender == "Female") {
      genderColor = Colors.pink;
      genderIcon = const Icon(Icons.female, color: Colors.white);
    }

    return Chip(
      label: Text(gender),
      avatar: genderIcon,
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: genderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      side: const BorderSide(color: Colors.transparent),
    );
  }
}

