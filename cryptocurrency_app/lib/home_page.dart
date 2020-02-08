import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final List<MaterialColor> _colors=[Colors.purple,Colors.red,Colors.indigo];
List currencies;
  @override
  void initState() async{
    super.initState();
    currencies=await getCurrencies();
  }

  Future<List>getCurrencies() async{
    String cryptoUrl="https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response =await http.get(cryptoUrl);
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CryptoApp"),
      ),
     body: _CryptoWidget(),
    );
  }

  Widget _CryptoWidget(){
    return new Container(
      child: new Flexible(
        child: new ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (BuildContext context, int index){
            final Map currency=currencies[index];
            final MaterialColor color=_colors[index%_colors.length];
            return _getListViewUi(currency,color);
          },
        ),  
      ),
    );
  }

  ListTile _getListViewUi(Map currency, MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(
          currency['name'][0],
        ),
      ),
      title: new Text(
        currency['name'],
        style: new TextStyle(fontWeight: FontWeight.bold),
        subtitle:_getSubtitleText(currency['usd'])
      ),
    );
  }
}

//Widget _