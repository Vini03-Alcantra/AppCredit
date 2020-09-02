import 'package:creditcard/controllers/offset_controller.dart';
import 'package:creditcard/controllers/page_controller.dart';
import 'package:creditcard/pages/widgets/item_page.dart';
import 'package:creditcard/pages/widgets/my_app_bar.dart';
import 'package:creditcard/pages/widgets/painel_top.dart';
import 'package:creditcard/pages/widgets/painel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState(){
    Provider.of<PageControllerApp>(context, listen: false).hideSheet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            MyAppBar(),                          
            PainelTopTwo(),                                       
            PainelTop(),                                       
            Consumer<PageControllerApp>(
              builder: (context, notifier, child){
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height - 50,                  
                  child: PageView(
                    physics: Provider.of<PageControllerApp>(context, listen: false).currentIndex != -1 
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                    onPageChanged: (index){
                      Provider.of<PageControllerApp>(context, listen: false).setPageIndex(index);
                    },
                    controller: _pageController,
                    children: <Widget>[
                      ItemPage(imageURL: "https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6", index: 0, color: Colors.pink, operadoraURL: "https://1000marcas.net/wp-content/uploads/2019/12/MasterCard-Logo.png"),
                      ItemPage(imageURL: "https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg", index: 1, color: Colors.white, operadoraURL: "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png"),
                      ItemPage(imageURL: "https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg", index: 2, color: Colors.purple, operadoraURL: "https://1000marcas.net/wp-content/uploads/2019/12/MasterCard-Logo.png",),
                    ],
                  ),
                );
              },                
            ),
            Consumer<PageControllerApp>(  
              builder: (context, value, child){
                bool isHide = Provider.of<PageControllerApp>(context, listen: false).isHide;
                return SlidingSheet(
                  elevation: 8,
                  cornerRadius: 16,
                  color: ThemeData.dark().primaryColor,
                  controller: Provider.of<PageControllerApp>(context, listen: false).sheetController,
                  snapSpec: SnapSpec(  
                    snap: true,
                    snappings: [(isHide ? 0.0 : 0.2), 0.4, 0.90],
                    positioning: SnapPositioning.relativeToAvailableSpace,
                  ),
                  builder: (BuildContext context, SheetState state) { 
                    return Material(  
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(  
                          child: Text("Este é o conteúdo do sheet")
                        ),
                      )
                    );
                  },  
                );
              },
            )
          ],
        )
      ),
    );
  }
}