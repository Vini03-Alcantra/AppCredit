import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: <Widget>[
          IconButton(  
            icon: Icon(Icons.arrow_back),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.check_circle),
            onPressed: (){}
          )
        ],
      ),
    );
  }
}