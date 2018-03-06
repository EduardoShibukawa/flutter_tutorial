import 'package:flutter/material.dart';

main() => runApp(new MaterialApp(
    home: new MyTextInput()
  ));

class MyTextInput extends StatefulWidget {

  @override
  MyTextInputState createState() => new MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  final TextEditingController controller = new TextEditingController();
  final String display_text = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Input Text"), 
        backgroundColor: Colors.deepOrange
      ),      
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Type in here!"                  
                ),
                onSubmitted: (String str) {
                  setState(() {
                    display_text += str + "\n";
                  });

                  controller.text = "";
                },
                controller: controller,
              ),
              new Text(display_text)
            ],
          ),
        ),
      ),
    );
  }
}


