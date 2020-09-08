import 'package:creditcard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      //padding: EdgeInsets.only(top: (MediaQuery.of(context).size.width * 0.05) + MediaQuery.of(context).padding.top, left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
      //padding: const EdgeInsets.all(8.0),
      child: SizedBox(            
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Consumer<PageControllerApp>( 
              builder: (context, value, child){
                return AnimatedOpacity(
                  opacity: value.currentIndex != -1 ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child:child                
                );              
              },
              child: IconButton(
                splashColor: Colors.black12,                              
                icon: Icon(Icons.arrow_back, size: 28),
                onPressed: (){                
                  Provider.of<PageControllerApp>(context, listen: false)
                    .setCurrentIndex(-1);
                  
                  Provider.of<PageControllerApp>(context, listen: false)
                    .hideSheet();
                  },
                ),
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