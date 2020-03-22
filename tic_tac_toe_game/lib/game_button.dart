import 'dart:ui';

import 'package:flutter/material.dart';

class GameButton{
  final  id;
  String text;
  Color bg;
  bool enabled;

  GameButton({this.id,this.bg = Colors.grey, this.enabled,this.text=""});

}