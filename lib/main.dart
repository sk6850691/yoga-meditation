import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yoga/providers/meditationprovider.dart';
import 'package:yoga/screens/HomePage1.dart';
import 'package:yoga/screens/homePage.dart';
import 'package:yoga/screens/meditatoin.dart';
import 'package:yoga/screens/playerscreen.dart';

import 'package:provider/provider.dart';
import 'ProductPage.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    
    MultiProvider(providers: [
      
      ChangeNotifierProvider.value(value: MeditationProvider())
    ],
    child:
    
    MaterialApp(
    home: HomePage(),
    routes: {
      '/productPage':(context)=>ProductPage()
    },
  ))
);
}




