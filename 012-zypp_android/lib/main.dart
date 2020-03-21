import 'package:flutter/material.dart';
import 'package:zypp_android/my_map.dart';
import 'package:zypp_android/util/theme.dart';
final ThemeData _AppTheme = CustomAppTheme().data;

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: _AppTheme,
      home: MyMap(),
    );
  }
}
