import 'package:flutter/material.dart';

void main() => new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //home: new MyHomePage(),
      ),
      home: new MyHomePage(),
    );

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double age = 0.0;
  var selectedYear;
  Animation animation;
  Animation animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = new AnimationController(
      //vsync: this,
      duration: new Duration(
        milliseconds: 1500,
      ),
      vsync: null,
    );
    animation = animationController;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate: new DateTime(2018),
            firstDate: new DateTime(1900),
            lastDate: new DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    setState(() {
      age = (2018 - selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Age Calcuator App with Animations"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
              child: new Text(selectedYear != null
                  ? selectedYear.toString()
                  : "Select your age"),
              borderSide: new BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
              onPressed: () => _showPicker(),
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            new Text(
              "Your age is ${age.toStringAsFixed(0)}",
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
