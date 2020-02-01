import 'package:flutter/material.dart';

class Shade extends StatelessWidget {

  final double opacity;
  final bool isLeft;

  Shade({this.opacity,this.isLeft});

  @override
  Widget build(BuildContext context) {
    return new Positioned.fill(
      child: new Opacity(
        opacity: opacity,
        child: new Container(
          color: isLeft?Colors.lightBlue:Colors.purple,
        ),
      ),
    );
  }
}