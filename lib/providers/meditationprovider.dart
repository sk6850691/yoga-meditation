import 'package:flutter/material.dart';
import 'package:yoga/models/meditationmodel.dart';
import 'package:yoga/services/meditationservice.dart';
class MeditationProvider with ChangeNotifier{

  MeditationService service = MeditationService();
  List<MeditationModel> meditations = [];
  MeditationProvider(){
    getaudios();
    notifyListeners();
  }

  getaudios()async{

    meditations = await service.getaudio();


  }



}