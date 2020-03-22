import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  //const CustomDialog({Key key, this.title, this.content, this.callback, this.actionText}) : super(key: key);
  CustomDialog(
      {this.title, this.content, this.callback, this.actionText = "Reset"});

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: new Text(actionText),
        ),
      ],
    );
  }
}
