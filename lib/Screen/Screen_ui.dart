import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_json_app/Model/User_class.dart';
import 'package:flutter_json_app/Screen/splash_screen.dart';
import 'package:flutter_json_app/Services/User_service.dart';
import 'package:http/http.dart' as http;

import 'Sqflite_json_data.dart';

class Screen_ui extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen_state();
  }
}

class Screen_state extends State<Screen_ui>{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: FutureBuilder<List<User_info>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(child: Splash_screen());
          }
          return ListView(
            children: snapshot.data.map((user) => ListTile(
              title: Text(user.name),
              subtitle: Text(user.address.city),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(user.name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                ),
              ),
            ),
            ).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Sqflite_data()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.auto_awesome),
      ),
    );
  }
}
