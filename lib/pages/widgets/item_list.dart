import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  String title;
  String subTitle;
  String value;
  Icon icon;
  Color color;

  ItemList(this.title, this.subTitle, this.value, this.icon, this.color);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 16
        ),
      ),    
      subtitle: Text(subTitle),
      trailing: Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 18
        ),
      ),
      leading: Container(
        height: 40,
        width: 40,
        child: Center(child: icon),
        decoration: BoxDecoration(  
          shape: BoxShape.circle, 
          gradient: RadialGradient(
            colors:  [  
              color,
              color.withOpacity(0.5)
            ]
          )
        ),
      ),
    );
  }
}