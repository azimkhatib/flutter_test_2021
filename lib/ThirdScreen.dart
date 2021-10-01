import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MusicPlay.dart';
import 'SecondScreen.dart';
class FirstRoute extends StatefulWidget {


  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
    bool _like = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      height: 85,
                      child: Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: MusicPlay(),
                                      duration: Duration(milliseconds: 800)));
                            },
                            child: Center(
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/flutter_test/ThumnailList.jpg"),
                                  ),
                                ),
                                title: Text("${snapshot.data.data()['Name']}"),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text("${snapshot.data.data()['Duration']}"),
                                ),
                                trailing: IconButton(
                                    icon: Icon(
                                        _like ? Icons.favorite : Icons.favorite_border,
                                        color: _like ? Colors.red : Colors.black26),
                                    onPressed: () {
                                      setState(() {
                                        _like = !_like;
                                      });
                                    }),
                              ),
                            ),
                          )),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    print("Firebaset() : " + FirebaseFirestore.instance.collection("Flutter").doc("Test").get().toString());
    return await FirebaseFirestore.instance.collection("Flutter").doc("Test").get();

  }
}
