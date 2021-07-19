import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/providers/audioplayerprovider.dart';
import 'package:yoga/providers/meditationprovider.dart';
import 'package:yoga/screens/playerscreen.dart';

import 'package:yoga/widgets/meditationwidget.dart';
class Meditation extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {

    final meditationProvider = Provider.of<MeditationProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children:[

              Container(
                padding: EdgeInsets.all(20),
                child: Text(

                  'MEDITATIONS', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),textAlign: TextAlign.center,
                ),
              ),



              Container(
              height: MediaQuery.of(context).size.height*0.43,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffc7b8f5),
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
                child: Container(
                 // margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                 // alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/meditation.jpg'),
                          fit: BoxFit.fill
                      )
                  ),

            ),
              ),)]
          ),

          ListView.builder(
             /* gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),*/
            shrinkWrap: true,

              itemCount: meditationProvider.meditations.length,
              itemBuilder: (context,index){

                return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAudio(URL: meditationProvider.meditations[index].url,imageurl: meditationProvider.meditations[index].imageurl,)));
                    },

                    child: MeditationWidget(meditationModel: meditationProvider.meditations[index],));
              })
        ],
      ),
    );
  }
}
