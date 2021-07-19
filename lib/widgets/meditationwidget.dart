
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yoga/models/meditationmodel.dart';
class MeditationWidget extends StatelessWidget {
  final MeditationModel meditationModel;

  const MeditationWidget({Key key, this.meditationModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage.memoryNetwork(
            
            placeholder: kTransparentImage, image: meditationModel.imageurl,
        imageCacheHeight: 70,
        imageCacheWidth: 100,),
      ),
      title: Text(meditationModel.title),
      trailing: IconButton(icon: Icon(Icons.play_circle_fill_outlined),),

    );
  }
}
