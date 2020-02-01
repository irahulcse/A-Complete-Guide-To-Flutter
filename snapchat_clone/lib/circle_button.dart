import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;
import 'camera_page.dart';

class ControlsLayer extends StatelessWidget {
  final double offset;
  final Function onTap;
  final _ShadowTween shadowTween;
  final _TakePictureTween buttonTween;
  final CameraIcon cameraIcon;
  final Function onCameraTap;

  ControlsLayer({this.offset, this.onTap, this.cameraIcon, this.onCameraTap}) : 
    this.buttonTween = new _TakePictureTween(
      new _TakePicture( 70.0, 100.0, onTap: onTap,),
      new _TakePicture( 50.0, 80.0,)
    ),
    this.shadowTween = new _ShadowTween(new _Shadow(-290.0), new _Shadow(-150.0));

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        shadowTween.lerp(offset),
        buttonTween.lerp(offset),
        new _Controls(cameraIcon, onCameraTap)
      ],
    );
  }
}

class _Controls extends StatelessWidget {
  final CameraIcon cameraIcon;
  final Function onCameraTap;

  _Controls(this.cameraIcon, this.onCameraTap);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: 35.0,
      left: 20.0,
      child: new SizedBox(
        width: 20.0,
        height: 40.0,
        child: new GestureDetector(
          onTap: onCameraTap,
          child: cameraIcon,
        ),
      ),
    );
  }
}

class _TakePicture extends StatelessWidget {
  final double bottom;
  final double diameter;
  final Function onTap;

  _TakePicture(this.bottom, this.diameter, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      bottom: bottom,
      left: MediaQuery.of(context).size.width / 2 - 50,
      child: new SizedBox(
        width: 100.0,
        height: 100.0,
        child: new Container(
          alignment: Alignment.bottomCenter,
          child: new SizedBox(
            width: diameter,
            height: diameter,
            child: new GestureDetector(
              onTap: onTap,
              child: new Container(
                decoration: new ShapeDecoration(
                  shape: new CircleBorder(
                    side: new BorderSide(
                      width: 5.0, color: Colors.white
                    )
                  )
                ),
              ),
            ),
          ),
        )
      )
    );
  }

  static _TakePicture lerp(_TakePicture begin, _TakePicture end, double t) {
    return new _TakePicture(
      lerpDouble(begin.bottom, end.bottom, t),
      lerpDouble(begin.diameter, end.diameter, t),
      onTap: begin.onTap
    );
  }
}

class _TakePictureTween extends Tween<_TakePicture> {

  _TakePictureTween(_TakePicture begin, _TakePicture end)
    : super(begin: begin, end: end);

  _TakePicture lerp(double t) => _TakePicture.lerp(begin, end, t);

}

class _Shadow extends StatelessWidget {
  final double bottom;

  _Shadow(this.bottom);

  final double shadowSize = 250.0;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      bottom: bottom,
      left: MediaQuery.of(context).size.width / 2 - (shadowSize / 2),
      child: new Transform.rotate(
        angle: 180 / 4,
        child: new Container(
          width: shadowSize,
          height: shadowSize,
          decoration: new BoxDecoration(boxShadow: <BoxShadow>[
            new BoxShadow(color: Colors.black12, blurRadius: 20.0)
          ], borderRadius: new BorderRadius.all(new Radius.circular(40.0))),
        ),
      ),
    );
  }

  static _Shadow lerp(_Shadow begin, _Shadow end, double t) {
    return new _Shadow(lerpDouble(begin.bottom, end.bottom, t));
  }
}

class _ShadowTween extends Tween<_Shadow> {
  _ShadowTween(_Shadow begin, _Shadow end) : super(begin: begin, end: end);

  @override
  _Shadow lerp(double t) => _Shadow.lerp(begin, end, t);
}