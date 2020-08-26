import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 90.0 + MediaQuery.of(context).size.height/5 + MediaQuery.of(context).padding.top),
      child: Container(
        color: Colors.red
      ),
    );
  }
}