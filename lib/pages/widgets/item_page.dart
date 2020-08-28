import 'package:creditcard/controllers/page_controller.dart';
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

  ItemPage({this.color, this.index, this.numberCard, this.name, this.imageURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<PageControllerApp>(context, listen: false).setCurrentIndex(index);
      },
      child: Consumer<PageControllerApp>(      
        child: Container(
          child: ClipRRect(  
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
        builder: (BuildContext context, PageControllerApp value, Widget child) { 
          int pageIndex = Provider.of<PageControllerApp>(context, listen: false).index;
          int currentIndex = Provider.of<PageControllerApp>(context, listen: false).currentIndex;
          bool hideCard;
          if (currentIndex != - 1) {
            if (pageIndex == currentIndex) {
              hideCard = false;
            } else {
              hideCard = true;
            }
          }else{
            hideCard = false;
          }
          
          return Stack(
            children: <Widget>[
              ControlledAnimation(
                tween: multiTrackTween,
                duration: multiTrackTween.duration,
                playback: pageIndex > index ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
                builder: (context, animation){
                  return Positioned(  
                    top: MediaQuery.of(context).size.height / 3,
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width - 90,
                    child: Transform.rotate(
                      angle: animation['rotate'],
                      child: Transform.scale(
                        child: AnimatedOpacity(
                          child: Padding(
                            padding: EdgeInsets.only(right: animation['padding_right']),
                            child: child,
                          ),
                          opacity: hideCard ? 0 :
                          animation['opacity'],
                          duration: Duration(milliseconds: 300)
                        ),
                        scale: animation['scale']
                      ),
                    ),
                  );
                }              
              )
            ],
          );
        },
      ),
    );
  }
}