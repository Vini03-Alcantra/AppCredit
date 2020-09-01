import 'package:creditcard/controllers/page_controller.dart';
import 'package:creditcard/framework/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_v1_migration/simple_animations/multi_track_tween.dart';
import 'package:sa_v1_migration/simple_animations/controlled_animation.dart';
class ItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageURL;

  final MultiTrackTween multiTrackTween = MultiTrackTween([
    Track('rotate')
      .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: -0.5)),
    Track('scale')
      .add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.5)),
    Track('opacity')
      .add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.0)),
    Track('padding_right')
      .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: 20)),
  ]);

  final MultiTrackTween animacaoCard = MultiTrackTween([
    Track('rotate')
      .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: 1.57)),
    Track('top')
      .add(Duration(milliseconds: 300), Tween(begin: 0.31, end: 0.07)),
    Track('scale')
      .add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.8))
      .add(Duration(milliseconds: 300), Tween(begin: 0.7, end: 0.8))
  ]);

  ItemPage({this.color, this.index, this.numberCard, this.name, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        int currentIndex = Provider.of<PageControllerApp>(context, listen: false).currentIndex;
        if(currentIndex != -1){
          Provider.of<PageControllerApp>(context, listen: false)
            .setIsFlipped(!Provider.of<PageControllerApp>(context, listen: false).isFlipped);
        } else{
          Provider.of<PageControllerApp>(context, listen: false)
            .setCurrentIndex(index);
        }        
      },
      child: Consumer<PageControllerApp>(      
        child: FlippableBox(
        front: FrontCard(imageURL, color),
        back: BackCard(color),
        isFlipped: Provider.of<PageControllerApp>(context, listen: false).isFlipped,
        ),
        builder: (BuildContext context, PageControllerApp value, Widget child) { 
          int pageIndex = Provider.of<PageControllerApp>(context, listen: false).index;
          int currentIndex = Provider.of<PageControllerApp>(context, listen: false).currentIndex;
          bool hideCard;
          if (currentIndex != - 1) {
            if (index == currentIndex) {
              hideCard = false;
            } else {
              hideCard = true;
            }
          }else{
            hideCard = false;
          }
          
          return AnimatedOpacity(
            duration: Duration(milliseconds: !hideCard ? 3000 : 10),
            opacity: hideCard ? 0 : 1,
            child: Stack(
              children: <Widget>[
              ControlledAnimation( 
              tween: animacaoCard,
              duration: animacaoCard.duration,
              playback: currentIndex != -1 
                ? Playback.PLAY_FORWARD
                : Playback.PLAY_REVERSE,
              builder: (context, animation){
                return Positioned(  
                  top: MediaQuery.of(context).size.height * animation['top'],
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.77,
                  child: Transform.rotate(
                  angle: animation['rotate'],
                  child: Transform.scale(
                    scale: animation['scale'],
                    child: ControlledAnimation(
                    tween: multiTrackTween,
                    duration: multiTrackTween.duration,
                    playback: pageIndex > index ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
                    builder: (context, animation){
                      return Transform.rotate(
                        angle: animation['rotate'],
                        child: Transform.scale(
                          child: Opacity(
                            opacity: animation['opacity'],
                            child: Padding(
                              padding: EdgeInsets.only(right: animation['padding_right']),
                              child: child,
                            ),
                            //²duration: Duration(milliseconds: 300)
                          ),
                          scale: animation['scale']
                        ),
                      );
                    }              
                  ),
                  )
                ),
                );
                }
                )
              ],
            ),
          );
        }
      )
    );                  
  }
}

class FrontCard extends Container {
  final String imageURL;
  final Color color;
  FrontCard(this.imageURL, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(  
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
          RotatedBox(
            quarterTurns: 1,  
            child: Image.network(  
              imageURL,
              fit: BoxFit.cover
            )
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children:<Widget>[
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Credit Card", 
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Image.network(
                        "https://i.ya-webdesign.com/images/white-wifi-logo-png-6.png",
                        width: 35,
                        height: 35,
                      )
                    ],
                  )
                ]
              ),
            )
          )
          ],
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
        color: color
      )
    );
  }
}

class BackCard extends Container {
  final Color color;
  BackCard(this.color);
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only( left: 60),
                child: Container(color: Colors.black38, width: 60),
              )
            )
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(  
              color: Colors.black26,
              offset: Offset(0, 10),
              blurRadius: 15
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: color
        ),
      ),
    );
  }
}