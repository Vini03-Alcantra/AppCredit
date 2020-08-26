import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
      Positioned(        
        top: MediaQuery.of(context).size.height / 3,
        height: MediaQuery.of(context).size.height / 1.6,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
          ),
        ),
      ),
      ]
    );
  }
}