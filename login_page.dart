import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.teal,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
     // child: 
    ),
    child: ListView(
      children: <Widget>[
        headerSection(),
        textSection(),
        buttomSection(),
      ]
    ),
    );
  }
}

Container buttomSection(){
  return Container(
    margin: EdgeInsets.only(top:30.0),
    padding: EdgeInsets.symmetric(horizontal:30.0),
    child: RaisedButton
  );
}
Container textSection(){
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal:20.0,
    ),
    margin: EdgeInsets.all(20.0),
    child: Column(
      children:<Widget>[
        txtEmail("Email", Icons.email),
        SizedBox(height: 30.0,),
        txtPassword("Password",Icons.lock),
      ]
    ),
  );
}


TextFormField txtEmail(String title, IconData icon){
  return TextFormField(
    style: TextStyle(
      color: Colors.white70,
    ),
    decoration: InputDecoration(
       hintText: title,
       hintStyle: TextStyle(
         color:Colors.blue,
          //icon:Icon(icon),
       ),
       icon: Icon(icon),
    ),
  );
}

Container headerSection(){
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 30.0
    ),
    child: Text(
      "Code Land",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}