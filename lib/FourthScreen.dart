import 'package:flutter/material.dart';
class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Image.asset("assets/flutter_test/ProfileScreen.jpg",height: double.infinity,width: double.infinity,),
      ),
    );
  }
}
