import 'package:flutter/material.dart';
import 'package:login_system_rest_apis/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Land',
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70,
      ),
    );
  }
}



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  SharedPreferences sharedPreferences;

  @override
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async{
    sharedPreferences= await SharedPreferences.getInstance();

    if(sharedPreferences.getString("token")==null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>LoginPage()), (Route <dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Code Land", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
         FlatButton(
           onPressed: (){
             sharedPreferences.clear();
             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>LoginPage()),(Route<dynamic>route)=>false);
           },
           child: Text("Log Out",style: TextStyle(
             color: Colors.white,
           )),
         ),
        ],

      ),
      body: Center(child: Text("Main Page")),
      drawer: Drawer(),
    );
  }
}