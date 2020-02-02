import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState()=> new HomePageState();
}

class HomePageState extends State<HomePage>{
   var num1=0,num2=0,num3=0;
  final TextEditingController t1= TextEditingController();
  final TextEditingController t2=TextEditingController();
  void add(){
    setState(() {
     num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      num3=num1+num2;
    });
  }
  void sub(){
    setState(() {
      num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      num3=num1-num2;
    });
  }
  void mul(){
    setState(() {
       num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      num3=num1*num2;
    });
  }
  void div(){
    setState(() {
       num1=int.parse(t1.text);
      num2=int.parse(t2.text);
      num3=num1~/num2;
    });
  }
  void clear(){
    setState(() {
      t1.text="0";
      t2.text="0";
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Calculator App'),
      ),
      body: new Container(
        padding: EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Output: $num3',
              style: new TextStyle(
                fontSize:20.0,
                fontWeight:FontWeight.bold,
                color: Colors.purple,
              )
            ),
            new TextField(
              keyboardType:  TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter number 1",
              ),
              controller: t1,
            ),
             new TextField(
              keyboardType:  TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter number 2",
              ),
              controller: t2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top:20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                new MaterialButton(
                  color: Colors.redAccent,
                  child: new Text('Add'),
                  onPressed: add,
                ),
                new MaterialButton(
                  color: Colors.pink,
                  child: new Text('Subtract'),
                  onPressed: sub,
                ),
                
              ]
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                new MaterialButton(
                  color: Colors.yellow,
                  child: new Text('Multiply'),
                  onPressed: mul,
                ),
                new MaterialButton(
                  color: Colors.blue,
                  child: new Text('Divided'),
                  onPressed: div,
                ),
                
              ]
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  color:Colors.purple,
                  child: new Text('Clear'),
                  onPressed:clear,
                )
              ],
            )
          ],
        )
      ),
    );
  }
}