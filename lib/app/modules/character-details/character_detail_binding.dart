import 'package:flutter_breaking/app/modules/character-details/character_detail_controller.dart';
import 'package:get/get.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CharacterDetailController());
    print('entrou no detail');
  }
}