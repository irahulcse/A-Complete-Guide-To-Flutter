import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scafoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form=formKey.currentState;

    if(form.validate()){
      form.save();
      performLogin();
    }
  }

  void performLogin(){
    final snackbar=new SnackBar(
      content: new Text("Email: $_email, password:$_password"),
    );
    scafoldKey.currentState.showSnackBar(snackbar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scafoldKey,
        appBar: new AppBar(
          title: new Text('Form Page'),
        ),
        // body: new Container(
        //   padding: const EdgeInsets.all(10.0),
        //   child: new Column(
        //     children: <Widget>[
        //       new TextFormField(
        //         autofocus: true,
        //       ),
        //       new TextField(
        //         focusNode: focusNode,
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: new FloatingActionButton(
        //   child: new Icon(Icons.add),
        //   onPressed: ()=> FocusScope.of(context).requestFocus(focusNode),
        // ),
        body: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (val) =>
                      !val.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val,
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (val)=>val.length<6?'Password too Short':null,
                  onSaved: (val)=>_password=val,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new RaisedButton(
                  child: new Text("Login"),
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ));
  }
}
