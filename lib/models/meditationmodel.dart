import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class MeditationModel{

  static const TITLE = 'title';
  static const URL = 'url';
  static const IMAGEURL = 'imageurl';

 String _imageurl;
  String _title;
  String _url;
  get imageurl =>_imageurl;
  get title=> _title;
  get url => _url;


  MeditationModel.fromSnapshot(DocumentSnapshot snapshot){

    _title =snapshot.data()[TITLE];
    _url = snapshot.data()[URL];
    _imageurl = snapshot.data()[IMAGEURL];
  }
}