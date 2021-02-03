import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_app/Model/User_class.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_json_app/Screen/Screen_ui.dart';

Future<List<User_info>> fetchJSONData() async {

  final String apiURL = 'https://jsonplaceholder.typicode.com/users';
  var jsonResponse = await http.get(apiURL);

  if (jsonResponse.statusCode == 200) {

    final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

    List<User_info> usersList = jsonItems.map<User_info>((json) {
      return User_info.fromJson(json);
    }).toList();

    return usersList;

  } else {
    throw Exception('Failed to load data from internet');
  }
}