import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/data/model/quote.dart';
import 'package:flutter_breaking/app/data/provider/characters_provider.dart';

class CharactersRepository {
  final CharactersProvider webServices;

  CharactersRepository(this.webServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await webServices.getAllCharacters();
    return characters.map((char) => Character.fromJson(char)).toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await webServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
