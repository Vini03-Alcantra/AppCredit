import 'package:creditcard/controllers/offset_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageURL;

  ItemPage({this.color, this.index, this.numberCard, this.name, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageController>(      
      child: Container(
        child:ClipRRect(  
          borderRadius: BorderRadius.circular(20),
          child: RotatedBox(
            quarterTurns: 1,  
            child: Image.network(  
              imageURL,
              fit: BoxFit.cover
            )
          )
        ),
        margin: EdgeInsets.symmetric(  
          horizontal: 20,
          vertical: 20
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 10),
              blurRadius: 15
            ),            
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
        )
      ),
      builder: (BuildContext context, PageController value, Widget child) { 
        return Stack(
          children: <Widget>[
            Positioned(  
              top: MediaQuery.of(context).size.height / 3,
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width - 90,
              child: Transform.rotate(
                angle: 0,
                child: child,
              ),
            )
          ],
        );
      },
    );
  }
}