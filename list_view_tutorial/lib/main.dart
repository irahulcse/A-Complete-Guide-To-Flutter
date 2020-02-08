import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Swipe to Dismiss',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String>items=new List<String>.generate(30, (i) => "Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Swipe to Dismiss Anything you are going to do"),
      ),
      body: new ListView.builder(
        itemCount:items.length,
        itemBuilder: (context, int index){
          return new Dismissible(
            key: new Key(items[index]), 
            //child: null,
            onDismissed: (direction){
              items.removeAt(index);
             Scaffold.of(context).showSnackBar(
               new SnackBar(
                 content: new Text("Items Dissmissed")
               )
             );
            },
            child : new ListTile(
              title: new Text("{$items[index]}"),
            ),
          );
        }
      ),
    );
  }
}