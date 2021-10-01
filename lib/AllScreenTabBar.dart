import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_2021/FourthScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'FirestScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'main.dart';
class AllScreenTab extends StatefulWidget {
  @override
  _AllScreenTabState createState() => _AllScreenTabState();
}

class _AllScreenTabState extends State<AllScreenTab> with TickerProviderStateMixin  {
  int count = 0;
  double iconssize = 25;
  double fontsize = 11;
  List<Widget> PortfolioPages = [
    FirestPage(),
    SecondScreen(),
    ThiredScreen(),
    FourthScreen(),
  ];
  TabController _tabControllerPortfolioa;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,DeviceOrientation.portraitDown
    ]);
    _tabControllerPortfolioa = new TabController(vsync: this, length: PortfolioPages.length);
    _tabControllerPortfolioa.addListener(_handleTabSelection);
  }
  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([

      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      print(_tabControllerPortfolioa.index);
    });
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: PortfolioPages.length,
      initialIndex: 0,
      child: WillPopScope(
        child: Scaffold(
          body: TabBarView(
            children: PortfolioPages,
            controller: _tabControllerPortfolioa,
          ),
          bottomNavigationBar: Container(
           color: Colors.white54,
            height: MediaQuery.of(context).size.height/12.9,
            child: new TabBar(
              controller: _tabControllerPortfolioa,
              tabs: [
                Tab(
                  icon: Icon(_tabControllerPortfolioa.index == 0 ? Icons.home : Icons.home_outlined, size: 30,),
                ),
                Tab(
                  icon: Icon(_tabControllerPortfolioa.index == 1 ?  FontAwesomeIcons.bookOpen : FontAwesomeIcons.bookOpen ,size: 25,),
                ),
                Tab(
                  icon: Icon(_tabControllerPortfolioa.index == 2 ?  Icons.music_note : Icons.music_note_outlined ,size: 30,) ,
                ),
                Tab(
                  icon: Icon(_tabControllerPortfolioa.index == 3 ?  Icons.person : Icons.person_outline  ,size: 30,),
                ),
              ],
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              indicatorColor: Colors.transparent,

            ),
          ),
        ),
      ),
    );
  }
}