import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  String text;
  List data;

  //get JSON => null;
  Widget build(BuildContext context) {
    return new AppBar(
      title: new Text("Load JSON App"),
    );
    body:
    new Container(
        child: new Center(
            child: new FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('load_json/person.json'),
      builder: (context, snapshot) {
        var myData = JSON.decode(snapshot.data.toString());
        return new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text("Name"+myData[index]['name']),
                  new Text("Age"+myData[index]['age']),
                  new Text("Height"+myData[index]['height']),
                  new Text("Gender"+myData[index]['gender']),
                  new Text("Hair Colour"+myData[index]['hair_colour']),
                ]
              ),
          );
        });
      },
    )));
  }
}
