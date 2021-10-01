import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

import 'AllScreenTabBar.dart';
import 'MusicPlay.dart';
import 'SecondScreen.dart';
import 'FourthScreen.dart';
import 'ThirdScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstRoute());
  }
}


