import 'package:flutter/material.dart';
import 'package:kan_card/size_config.dart';

class CardReviewPage extends StatelessWidget {
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
          child: Row(children: [
            Text(
              'test',
            )
          ]),
        ),
      ),
    );
  }
}
