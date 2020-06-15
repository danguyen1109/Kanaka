import 'package:flutter/material.dart';

import '../models/dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override 
  _DogDetailPageState createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  final double dogAvatarSize = 150.0;

  Widget get dogImage {
    return Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            offset: const Offset(1,2),
            blurRadius: 2,
            spreadRadius: -1,
            color: const Color(0x33000000)),
          const BoxShadow(
            offset: const Offset(2,1),
            blurRadius: 3,
            spreadRadius: 0,
            color: const Color(0x24000000)),
          const BoxShadow(
            offset: const Offset(3,1),
            blurRadius: 4,
            spreadRadius: 2,
            color: const Color(0x1F000000)),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.dog.imageUrl),
        ),
          ),
          );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Icon(
        Icons.star,
        size: 40.0,
      ),
      Text(' ${widget.dog.rating} / 10',
      style: Theme.of(context).textTheme.headline3),
    ],);
  }

  Widget get dogProfile {
    return Container( 
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1,0.5,0.7,0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: 
              const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Text(widget.dog.description),  
          ),
          rating
        ],
      )
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}