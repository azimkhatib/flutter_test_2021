import 'package:flutter/material.dart';
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _like = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
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
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Practices"),
                    ],
                  )
              ),
              Container(
                height: 320,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,int){
                      return  SizedBox(
                        height: 85,
                        child: Card(
                            child: InkWell(
                              onTap: (){
                                // launch(Globals.urls[int]);
                              },
                              child:Center(
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/flutter_test/ThumnailList.jpg"),
                                    ),
                                  ),
                                  title: Text("Songs"),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text("00:00"),
                                  ),
                                  trailing: IconButton(icon: Icon(_like ? Icons.favorite : Icons.favorite_border,color: _like ? Colors.red : Colors.black26),
                                      onPressed: (){
                                        setState(() {
                                          _like =! _like;
                                        });
                                      }),
                                ),
                              ),
                            )
                        ),
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
