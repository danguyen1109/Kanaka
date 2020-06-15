// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'pages/card_review_page.dart';

// Size Config on Init
import 'size_config.dart';

import 'models/card_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanji Card',
      theme: ThemeData(
          // primaryColor: Colors.white,
          brightness: Brightness.dark),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //   List<Dog> initialDoge = []
  // ..add(Dog('Ruby','Portland, OR, USA',
  // 'Ruby is a goodgirl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
  // ..add(Dog('Rex', 'Seattl, WA, USA', 'Best in Show 1999'))
  // ..add(Dog('Herbert', 'Dallas, TX, USA', 'A very good boye.'));

  List<KanCard> kanCard = []
    ..add(KanCard('1', 'rice field', 'look like a rice field from above'))
    ..add(KanCard('2', 'day', 'look like a new day outside the windows'))
    ..add(KanCard('3', 'moon',
        'looking like the sun goes down longer into the night and the moon rises'));

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5)),
              studyCard,
              Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5)),
              manageVocab,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get studyCard {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: showCardReviewPage(),
          // onTap: () {
          //   print('Card tapped.');
          // },
          
          child: Container(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
            width: SizeConfig.blockSizeHorizontal * 80,
            height: SizeConfig.blockSizeVertical * 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.school,
                  color: Colors.amber,
                  size: 42,
                ),
                Text(
                  'Review',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: SizeConfig.blockSizeHorizontal * 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget get manageVocab {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 10),
            width: SizeConfig.blockSizeHorizontal * 80,
            height: SizeConfig.blockSizeVertical * 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.amber,
                  size: 42,
                ),
                Text(
                  'Manage',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: SizeConfig.blockSizeHorizontal * 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Create page Review
  showCardReviewPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CardReviewPage();
        },
      ),
    );
  }
}
