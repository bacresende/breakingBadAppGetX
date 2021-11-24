import 'package:flutter_breaking/app/data/model/characters.dart';
import 'package:get/get.dart';

class CharacterDetailController extends GetxController {

  Character character;
  //BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();

      character = Get.arguments as Character;
      print('personagem');
      print(character.name);

    }

}