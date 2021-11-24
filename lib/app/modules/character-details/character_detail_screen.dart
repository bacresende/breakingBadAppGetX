import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/app/modules/character-details/character_detail_controller.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/utils/my_colors.dart';
import 'package:get/get.dart';

class CharacterDetailScreen extends GetView<CharacterDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: MyColors.dark_100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                controller.character.nickName,
                style: TextStyle(color: MyColors.white),
              ),
              background: Hero(
                tag: controller.character.charId,
                child: Image.network(
                  controller.character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                          'Job : ', controller.character.jobs.join(' / ')),
                      buildDivider(315),
                      characterInfo('Appeared in : ',
                          controller.character.categoryForTwoSeries),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          controller.character.appearanceOfSeasons.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ',
                          controller.character.statusIfDeadOrAlive),
                      buildDivider(300),
                      controller.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo(
                              'Better Call Saul Seasons : ',
                              controller.character.betterCallSaulAppearance
                                  .join(" / ")),
                      controller.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo(
                          'Actor/Actress : ', controller.character.acotrName),
                      buildDivider(235),
                      SizedBox(
                        height: 20,
                      ),
                      /*BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  characterInfo(String title, String join) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: join,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.yellow,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(MyColors.white),
      ),
    );
  }

  Widget displayRandomQuoteOrEmptySpace(QuotesLoaded state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.white,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.white,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
