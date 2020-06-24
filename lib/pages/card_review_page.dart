import 'package:flutter/material.dart';
import 'package:kan_card/size_config.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_kanji_view/flutter_kanji_view.dart';

class CardReviewPage extends StatefulWidget {
  @override
  _CardReviewPageState createState() {
    return _CardReviewPageState();
  }
}

class _CardReviewPageState extends State<CardReviewPage> {
  var char = getKanjiUnicode('了');

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.white70,
              Colors.white60,
              Colors.white54,
              Colors.white30,
            ],
          ),
        ),
        child: Center(
          child: Column(children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10)),
            FlipCard(
              front: frontCard,
              back: backCard,
              direction: FlipDirection.HORIZONTAL,
            ),
            // Padding(
            //     padding:
            //         EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10)),
            // reviewCard,
          ]),
        ),
      ),
    );
  }

  Widget get frontCard {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
          width: SizeConfig.blockSizeHorizontal * 75,
          height: SizeConfig.blockSizeVertical * 66,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 22),
              ),
              Text(
                'completo',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Roboto',
                  letterSpacing: 1,
                  fontSize: SizeConfig.blockSizeHorizontal * 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get backCard {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
          width: SizeConfig.blockSizeHorizontal * 75,
          height: SizeConfig.blockSizeVertical * 66,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 22),
                child: KanjiViewer.svg("assets/vectors/" + char + ".svg",
                scaleToViewport: true,
                duration: new Duration(seconds: 6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
