import 'package:chat_app/chat_message.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  @override
 // _ChatScreenState createState() => _ChatScreenState();3
 State createState()=>new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController=new TextEditingController();
  final List<ChatMessage> _messages=<ChatMessage>[

  ];


  void _handleSubmitted(String text){
    _textEditingController.clear();
    ChatMessage message=new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
  Widget _textComposerWidget(){
      return new IconTheme(
            data: new IconThemeData(
            color: Colors.purple,
          ),
              child: new Container(
          margin:EdgeInsets.symmetric(horizontal:8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                    decoration: new InputDecoration.collapsed(
                      hintText: 'Send A message',
                    ),
                    controller: _textEditingController,
                    onSubmitted: _handleSubmitted,
                ),
              ),
              new Container(
                margin: EdgeInsets.symmetric(horizontal:4.0),
                child: new IconButton(
                  icon:new Icon(Icons.send),
                  onPressed:()=> _handleSubmitted(_textEditingController.text),
                ),
              )
            ],
          ),
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(9.0),
              reverse: true,
              itemBuilder: (_,int index)=>_messages[index],
              itemCount:_messages.length,
            )
          ),
          new Divider(
            height:1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
             color:Theme.of(context).cardColor, 
            ),
            child: _textComposerWidget(),
          )
        ],
      );
  }
}