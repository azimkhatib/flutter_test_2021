import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';


class MusicPlay extends StatefulWidget {
  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _play = true;
  bool _pause = true;
  void song() async {
    assetsAudioPlayer.open(
      Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
      autoStart: _play,
      showNotification: true,
      loopMode: LoopMode.single,
    );
  }

  void initState() {
    super.initState();
    song();
  }
  @override
  void dispose() {
    super.dispose();
  }
  void pause() {
    setState(() {
     _pause = true;
    });
    assetsAudioPlayer.pause();
  }
  void play() {
    setState(() {
     _play = true;
    });
    assetsAudioPlayer.play();
  }
  void volumeDown(){
    assetsAudioPlayer.setVolume(0.0);
  }
  void volumeUp(){
    assetsAudioPlayer.setVolume(0.9);
  }

  void dismiss(){
    assetsAudioPlayer.stop();
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            dismiss();

          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30,top: 5,bottom: 5),
            child: SizedBox(
              height: 10,
              width: 50,
              child: ClipOval(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pause  =! _pause;
                      setState(() {
                        _pause  ?  volumeUp() : volumeDown();
                      });
                    });
                  },
                  child: Icon(
                    _pause ? Icons.volume_down : Icons.volume_off , size: 30,
                  ),
                ),

              ),
            ),
          ),
        ],
      ),
        body: WillPopScope(
          onWillPop: (){
            dismiss();
          },
          child: Stack(
      children: [
          Container(
            child: Image.asset(
              "assets/flutter_test/MusicBackground.jpg",
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            right: 5,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Center(
                child: RaisedButton(
                    color: Colors.white,
                    child: Icon(
                      _play ? Icons.pause : Icons.play_arrow, color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _play  =! _play;
                        setState(() {
                          _play == false ?  pause() : play();
                        });
                      });
                      print("--------------PLAYYYYYYYYYY : " + _play.toString());
                    }
                ),
              ),
            ),
          ),
      ],
    ),
        ));
  }
}


