import 'package:flutter/material.dart';
import 'package:flutter_json_app/Model/User_class.dart';
import 'package:flutter_json_app/Services/db_helper_class.dart';

class Sqflite_data extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Sqflite_state();
  }
}

class Sqflite_state extends State<Sqflite_data>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON SQL Data"),
      ),
      body: FutureBuilder<List<User_info>>(
        future: DatabaseHelper.instance.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<User_info>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                User_info item = snapshot.data[index];
                return ListTile(
                  title: Text(item.username),
                  leading: Text(item.id.toString()),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}