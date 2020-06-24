import 'package:flutter/material.dart';
import 'models/card_model.dart';
import 'flash_card.dart';


class CardList extends StatelessWidget {
  // final List<Dog> doggos;
  // DogList(this.doggos);

  final List<KanCard> cards;
  CardList(this.cards);

  @override 
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, int) {
        return FlashCard(cards[int]);
      },
    );
  }
}
