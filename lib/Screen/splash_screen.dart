import 'dart:async';
import 'package:flutter/material.dart';
import 'Screen_ui.dart';
import 'Sqflite_json_data.dart';
import 'package:hexcolor/hexcolor.dart';

class Splash_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splash_screen_state();
  }
}

class Splash_screen_state extends State<Splash_screen>{

  void initState() {
    super.initState();
     Timer(Duration(seconds: 20),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Screen_ui()
            )
        ),
     );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child:Image.asset('asset/splash.gif'),
          //Image.network('https://miro.medium.com/max/600/1*gwQB_VLm07m11ZLyO35d2g.gif'),
          color:HexColor("ffffff"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),

    );
  }

}