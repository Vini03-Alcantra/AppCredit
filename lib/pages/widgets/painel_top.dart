import 'package:flutter/material.dart';

class PainelTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
        child: Container(      
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                children: <Widget>[
                  Text(
                    "Cartões de Crédito",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),                    
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}