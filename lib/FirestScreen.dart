import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'SecondScreen.dart';

class FirestPage extends StatefulWidget {
  @override
  _FirestPageState createState() => _FirestPageState();
}

class _FirestPageState extends State<FirestPage> {
  @override
  Widget build(BuildContext context) {
    ///debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              reverse: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.blue,
                    child: Image.asset(
                      "assets/flutter_test/FigmaHomeScreen.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 50, left: 25,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular"),
                          InkWell(child: Text("See All",style: TextStyle(color: Colors.blue),),
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade,
                                  child:SecondScreen(),duration: Duration(milliseconds: 800)));
                            },
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 200,
                      child: ListView.builder(
                          padding: EdgeInsets.all(15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, int) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: SizedBox(
                                    height: 50,
                                    child: Container(
                                      child: Image.asset(
                                        "assets/flutter_test/PopularCatagory.jpg",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )),
                              ),
                            );
                          })),
                  Padding(
                      padding: const EdgeInsets.only(top: 50, left: 25,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New"),
                          InkWell(child: Text("See All",style: TextStyle(color: Colors.blue),),
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade,
                                  child:SecondScreen(),duration: Duration(milliseconds: 800)));
                            },
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 200,
                      child: ListView.builder(
                          padding: EdgeInsets.all(15),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, int) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: SizedBox(
                                    height: 50,
                                    child: Container(
                                      child: Image.asset(
                                        "assets/flutter_test/PracticeScreen.jpg",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )),
                              ),
                            );
                          })),
                ],
              ),
            )
          ],
        )
    );
  }
}