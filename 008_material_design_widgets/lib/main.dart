import 'package:flutter/material.dart';


void main()=> runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch:Colors.red,
  ),
  home: new HomePage(),
));



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Material App Design"),
      ),
     body:  Body(),
    );
  }
}
class Body extends StatelessWidget {
  AlertDialog dialog=new AlertDialog(
    content: new Text(
    "Utils App",
    style: new TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    ),
    ),
    title: new Text('Hello World!'),
    //body: new Body(),
  );
  @override
  Widget build(BuildContext context) {
     return new Container(
        child: new Center(
          child: new RaisedButton( 
            color: Colors.orange,
            child: new Text(
              "Click Me",
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
           // onPressed: ()=> print("i am presssed"),
          //  onPressed: ()=> Scaffold.of(context).showSnackBar(
          //    new SnackBar(
          //      content: new Text("You clicked me!"),
          //      duration: new Duration(seconds: 1,
          //    ),
          //  ),
          // ),
          onPressed:()=> showDialog(context: context, child:dialog),
        ),
      ),
     );
  }
}
