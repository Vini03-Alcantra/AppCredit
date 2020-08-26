import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageURL;

  ItemPage({this.color, this.index, this.numberCard, this.name, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
      Positioned(        
        top: MediaQuery.of(context).size.height / 3,
        height: MediaQuery.of(context).size.height / 1.6,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.network(imageURL, fit: BoxFit.cover)
            )
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 15
              )
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
          ),
        ),
      ),
      ]
    );
  }
}