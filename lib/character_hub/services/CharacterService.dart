import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_universe/character_hub/models/character.dart';

class CharacterService {
  final String baseUrl = "https://rickandmortyapi.com/api";

  Future<List<Character>> getByName(String name) async {
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/character/?name=$name')
    );

    if (response.statusCode != HttpStatus.ok) {
      return [];
    }

    final jsonResponse = json.decode(response.body);
    final List characters = jsonResponse['results'];

    return characters.map(
      (character) => Character.fromJson(character)
    ).toList();
  }
}