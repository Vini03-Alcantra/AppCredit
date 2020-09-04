import 'package:creditcard/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
class PainelTopTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerApp>(  
      builder: (context, notifier, child){
        
        return AnimatedPadding(
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.only(top: notifier.currentIndex != -1 ? 0 : 20),
          child: AnimatedOpacity(
          opacity: notifier.currentIndex != -1 ? 1 : 0,
          child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
            child: Container(      
              height: MediaQuery.of(context).size.height / 5,          
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text("Full Card", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                  SizedBox(height: 0.03 * MediaQuery.of(context).size.height),              
                  AnimatedPadding(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.only(
                      top: notifier.currentIndex != -1 ? 0 : 40
                    ),
                    child: Center(child: Text("Rotate the card to view the security code", style: TextStyle(fontSize: 14))))
                ],
              ),
            ),
          ),
          ),
          duration: Duration(milliseconds: 300)
          )
        );
      },          
    );
  }
}