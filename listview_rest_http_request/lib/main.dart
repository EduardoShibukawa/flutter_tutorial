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
  List data;

  Future<bool> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Acccept": "application/json"
      }      
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    
    return true;
  }

  @override
  void initState(){
    this.getData();
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List View"),
      ),
      body: new ListView.builder(        
        itemCount: data.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
                child: new Text(data[index]['title']),            
          );        
        },                  
        itemExtent: 50.0,
        padding: new EdgeInsets.symmetric(vertical: 16.0)
      )      
    );
  }
}