import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga/models/meditationmodel.dart';
class MeditationService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collection = 'meditations';

 Future<List<MeditationModel>> getaudio(){


   return firestore.collection(collection).get().then((results){

     List <MeditationModel> list = [];
     for(DocumentSnapshot snapshot in results.docs){
       list.add(MeditationModel.fromSnapshot(snapshot));
     }
     return list;
   }) ;



  }

}