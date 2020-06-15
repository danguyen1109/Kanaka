import 'package:flutter/material.dart';
import 'models/dog_model.dart';
import 'pages/dog_detail_page.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override 
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

  Dog dog;
  String renderUrl;

  _DogCardState(this.dog);

  @override 
  Widget build(BuildContext context) {
    return InkWell(
    onTap: showDogDetailPage,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(children: <Widget>[
          Positioned(
            left: 50.0,
            child: dogCard,
          ),
          Positioned(top:7.5, child: dogImage),
        ],),
      ),
    ),);
  }

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit:BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                   style: Theme.of(context).textTheme.headline5),
              Text(widget.dog.location,
                   style: Theme.of(context).textTheme.subtitle1),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.dog.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return DogDetailPage(dog);
      },),
    );
  }
}