import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/data/provider/characters_provider.dart';
import 'package:flutter_breaking/app/data/repository/characters_repository.dart';
import 'package:flutter_breaking/app/data/model/quote.dart';
import 'package:get/get.dart';

class CharacterDetailController extends GetxController {

  Character character;
  CharactersRepository repository;
  RxList<Quote> quotes = <Quote>[].obs;
  @override
    void onInit() async {
      super.onInit();

      repository = CharactersRepository(CharactersProvider());

      character = Get.arguments as Character;

      await this.setQuotes();
    
    }

    Future<void> setQuotes() async {
      this.quotes.addAll(await this.repository.getCharacterQuotes(this.character.name));
    }

}