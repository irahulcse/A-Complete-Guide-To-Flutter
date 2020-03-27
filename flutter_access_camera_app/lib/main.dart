import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'WhatsAppHome.dart';

List<CameraDescription>cameras;


Future<Null>main() async{
  cameras=await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'WhatsApp',
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color((0xff25D366),
      ),
      
    ),
    home: new WhatsAppHome(cameras),
    );
  }
}