import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new AwesomeButton()
  )
);

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new  AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {
  List<String> strings = ["Flutter", "Is", "Awesome"];
  int counter = 0;
  String displayed_string = "";

  void onPressed() {
    setState(() {
      displayed_string = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful Widget!"),
        backgroundColor: Colors.orange,        
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                displayed_string,
                style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                child: new Text(
                  "Press me!",
                  style: new TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0
                  )),
                color: Colors.red,
                onPressed: onPressed,
              )
            ],
          )
        ),
      ),
    );
  }

}
