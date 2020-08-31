import 'package:flutter/material.dart';

class PainelTopTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
        child: Container(      
          height: MediaQuery.of(context).size.height / 5,          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Full Card", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 0.03 * MediaQuery.of(context).size.height),              
              Text("Rotate the card to view the security code", style: TextStyle(fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}