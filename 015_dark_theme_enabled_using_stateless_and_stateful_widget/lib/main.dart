import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   bool darkThemeEnabled=false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: darkThemeEnabled?ThemeData.dark():ThemeData.light(),
//       home:  HomePage(),
//     );
//   }

//   Widget HomePage() {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Dynamic Theming in Flutter"),
//       ),
//       body: Center(
//         child: Text("Hello World!"),
//       ),
//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
//             ListTile(
//               title: Text("Dark Theme"),
//               trailing: Switch(
//                 value: darkThemeEnabled,
//                 onChanged: (changedTheme){
//                  setState(() {
//                    darkThemeEnabled=changedTheme;
//                  });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }

class MyApp extends StatelessWidget {
  //bool darkThemeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
        theme: ThemeData.light(),
        home: HomePage(snapshot.data),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();


class HomePage extends StatelessWidget {
  bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Dark Theme Implementation in Stateless Widget"),
          ),
          body: Center(
            child: Text("Hello World"),
          ),
          drawer: new Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Dark Theme"),
                  trailing: Switch(
                    value: darkThemeEnabled,
                    onChanged: bloc.changeTheme,
                  ),
                )
              ],
            ),
          ),
        );
  }
}