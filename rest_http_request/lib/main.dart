import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new HomePage()
));

class HomePage extends StatefulWidget {  
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Acccept": "application/json"
      }      
    );

    List data  = JSON.decode(response.body);

    print(data[0]["title"]);
    return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),          
          onPressed: getData,
        ),
      ),
    );
  }
}