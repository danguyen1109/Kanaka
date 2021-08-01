import 'package:flutter/material.dart';
import 'models/card_model.dart';

class FlashCard extends StatefulWidget {
  final KanCard kancard;

  FlashCard(this.kancard);

  @override
  _FlashCardState createState() => _FlashCardState(kancard);
}

class _FlashCardState extends State<FlashCard> {
  KanCard kancard;
  String renderUrl;

  _FlashCardState(this.kancard);

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.grey : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: 75),
        ),
      ),
    );
  }

  // showDogDetailPage() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) {
  //       return DogDetailPage(dog);
  //     },),
  //   );
  // }
}
