import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class UserProvider with ChangeNotifier{



  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  signUp(){
   // auth.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text)


  }



}