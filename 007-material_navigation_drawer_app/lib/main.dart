import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'new_page.dart';
void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.purple),
      home: new HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a":(BuildContext context)=> new NewPage("New Page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation Drawer App"),
        elevation: defaultTargetPlatform ==TargetPlatform.android ?5.0:0.0,      
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Rahul Chandra"),
              accountEmail: new Text("1rahulchandra1@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('RJ'),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: new Text('RCJ'),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.arrow_upward),
              onTap:(){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context)=>
                      new NewPage("Page One"),
                  )
                );
              },
            ),
            new ListTile(
              title: new Text("Page 2"),
              trailing: new Icon(Icons.arrow_downward),
              onTap:(){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context)=>
                      new NewPage("Page Two"),
                  )
                );
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}