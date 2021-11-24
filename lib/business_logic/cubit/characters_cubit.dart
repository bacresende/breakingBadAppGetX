import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:flutter_breaking/app/data/model/quote.dart';
import 'package:flutter_breaking/app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  List<Character> listChar = [];

  CharactersCubit(this.repository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    repository.getAllCharacters().then((value) {
      emit(CharactersLoaded(value));
      listChar = value;
    });

    return listChar;
  }

  void getQuotes(String charName) {
    repository.getCharacterQuotes(charName).then((value) {
      emit(QuotesLoaded(value));
    });
  }
}
