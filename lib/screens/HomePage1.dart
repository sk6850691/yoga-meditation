import 'package:flutter/material.dart';

import 'meditatoin.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  PageController pagecontroller = PageController();
  int currentindex = 0;
  onPageChanged(index){
    setState(() {
      currentindex = index;
    });

  }
  onButtonTapped(index){


    setState(() {
      currentindex = index;
      pagecontroller.animateToPage(currentindex, duration:Duration(milliseconds: 500) , curve: Curves.ease);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home) ,title:Text('Meditation') ),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),title:Text('Yoga') ),
          BottomNavigationBarItem(icon:Icon(Icons.play_circle_fill_outlined) ,title:Text('3') ),
          BottomNavigationBarItem(icon: Icon(Icons.history),title: Text('4')),
        ],
        onTap: (index){
          onButtonTapped(index);
        },
      ),
      body: PageView(
        onPageChanged: (index){
          onPageChanged(index);
        },
        children: [

         Meditation()
        ],
        controller: controller ,
      ),




    );
  }
}
