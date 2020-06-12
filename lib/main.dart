// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'models/dog_model.dart';
import 'dog_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanji Card',
      theme: ThemeData( 
        //primaryColor: Colors.white,
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Kanji RTK Card'),
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
    List<Dog> initialDoge = []
  ..add(Dog('Ruby','Portland, OR, USA',
  'Ruby is a goodgirl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
  ..add(Dog('Rex', 'Seattl, WA, USA', 'Best in Show 1999'))
  ..add(Dog('Herbert', 'Dallas, TX, USA', 'A very good boye.'));

  Widget build(BuildContext context) {
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
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: Center(child: DogList(initialDoge),),
      ),
    );
  }
}

