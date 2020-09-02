import 'package:creditcard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(      
      height: MediaQuery.of(context).size.height * 0.06,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              splashColor: Colors.black12,                              
              icon: Icon(Icons.arrow_back, size: 28),
              onPressed: (){                
                Provider.of<PageControllerApp>(context, listen: false)
                  .setCurrentIndex(-1);
              },
            ),            
            Consumer<PageControllerApp>(
              builder: (context, value, child){
                return AnimatedOpacity(
                  opacity: value.currentIndex != -1 ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: child,
                );
              },
              child: IconButton(
                icon: Icon(Icons.check_circle_outline),
                onPressed: (){}
              ),  
            ),            
          ],
        ),
      ),
    );
  }
}