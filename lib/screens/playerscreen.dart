
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yoga/providers/meditationprovider.dart';
import 'package:provider/provider.dart';
class MyAudio extends StatefulWidget {

  String URL;
  String imageurl;
  MyAudio({this.URL,this.imageurl});
  @override
  _MyAudioState createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {

  AudioPlayer audioPlayer = AudioPlayer();
  String audioState;
  bool playing = false;
  Duration position  = new Duration();
  Duration duration = new Duration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });

    audioPlayer.play(widget.URL);
    setState(() {
      playing = true;
    });







  }


  playAudio(String url)async{
    int result = await audioPlayer.play(url);
    if(result == 1){
      setState(() {
        playing = true;
      });
    }
  }

  pauseAudio()async{
    int result =await  audioPlayer.pause();
    if(result ==1){
      setState(() {
        playing = false;
      });
    }
  }

  resumeAudio()async{
    int result = await audioPlayer.resume();
    if(result == 1){
      setState(() {
        playing = true;
      });
    }
  }
  seekAudio(durationToSeek){

    audioPlayer.seek(durationToSeek);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<MeditationProvider>(context);
    return
      Scaffold(
          body: 
          

          
          
          
          
          Stack(

    children:[


      Container(
      height: 900,
                  
                  
                  child: Image.network(widget.imageurl,fit: BoxFit.fill,)

              ),

      Padding(
        padding: EdgeInsets.fromLTRB(40, 200, 10, 30),
        child: RawMaterialButton(
          onPressed: () {

            if(playing == true){

                setState(() {
                  pauseAudio();
                });

            }else{

               setState(() {
                 resumeAudio();
               });
            
            }
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            playing?Icons.pause:Icons.play_circle_fill_outlined,
            size: 35.0,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
      ),




              Padding(
                padding: EdgeInsets.fromLTRB(20, 400, 0, 10),
                child: Container(
                  width: duration.inSeconds.toDouble(),
                  child: Slider(

                      value: position.inSeconds.toDouble(),
                      onChanged: (double value){
                        setState(() {
                          audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                      min: 0.0,
                      max:duration.inSeconds.toDouble()) ,
                  ),
                ),

            ],)
      
      );


  }}
