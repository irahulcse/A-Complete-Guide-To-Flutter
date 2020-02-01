import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


List<CameraDescription> _cameras;
CameraController _controller;

IconData _cameraLensIcon(CameraLensDirection currentDirection) {
  switch (currentDirection) {
    case CameraLensDirection.back:
      return Icons.camera_front;
    case CameraLensDirection.front:
      return Icons.camera_rear;
    case CameraLensDirection.external:
      return Icons.camera;
  }

  throw new ArgumentError('Unknown lens direction');
}

void playPause() {
  if (_controller != null) {
    if (_controller.value.isStarted) {
      _controller.stop();
    } else {
      _controller.start();
    }
  }
}

Future<Null> _restartCamera(CameraDescription description) async {
    final CameraController tempController = _controller;
    _controller = null;
    await tempController?.dispose();
    _controller = new CameraController(description, ResolutionPreset.high);
    await _controller.initialize();
}

Future<Null> flipCamera() async {
  if (_controller != null) {
    var newDescription = _cameras.firstWhere((desc) {
      return desc.lensDirection != _controller.description.lensDirection;
    });

    await _restartCamera(newDescription);
  }
}

class CameraIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      return new Icon(
        _cameraLensIcon(_controller.description.lensDirection),
        color: Colors.white,
      );
    } else {
      return new Container();
    }
  }
}

class CameraHome extends StatefulWidget {
  @override
  _CameraHomeState createState() => new _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> with WidgetsBindingObserver {
  bool opening = false;
  String imagePath;
  int pictureCount = 0;

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addObserver(this);

    availableCameras().then((cams) {
      _cameras = cams;
      _controller = new CameraController(_cameras[1], ResolutionPreset.high);
      _controller.initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      var description = _cameras.firstWhere((desc) {
        return desc.lensDirection == _controller.description.lensDirection;
      });

      _restartCamera(description)
        .then((_) { 
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenDimension = MediaQuery.of(context).size;
    final List<Widget> columnChildren = <Widget>[];

    if (_controller != null && _controller.value.initialized) {
      columnChildren.add(new Expanded(
        child: new FittedBox(
          fit: BoxFit.fitHeight,
          alignment: AlignmentDirectional.center,
          child: new Container(
            width: screenDimension.width,
            height: screenDimension.height * _controller.value.aspectRatio,
            child: new CameraPreview(_controller),
          )
        )
      ));
    } else {
      columnChildren.add(new Center(
        child: new Directionality(
          textDirection: TextDirection.ltr,
          child: new Icon(Icons.question_answer)
        )
      ));
    }

    return new Column(
      children: columnChildren,
    );
  }

  Widget playPauseButton() {
    return new Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: new FlatButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isStarted) {
              _controller.stop();
            } else {
              _controller.start();
            }
          });
        },
        child: new Icon(
          _controller.value.isStarted ? Icons.pause : Icons.play_arrow
        ),
      ),
    );
  }
}