import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/custom_dialog.dart';
import 'package:tic_tac_toe_game/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonList = doInit();
  }
  var player1;
  var player2;
  var activePlayer;

  List<GameButton> doInit() {
    player1=new List();
    player2=new List();
    activePlayer=1;
    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];

    return gameButtons;
  }
 
  void playGame(GameButton gb){
    setState(() {
      if(activePlayer==1){
        gb.text="X";
        gb.bg=Colors.red;
        activePlayer=2;
        player1.add(gb.id);
      }
      else{
        gb.text="0";
        gb.bg=Colors.black;
        activePlayer=1;
        player2.add(gb.id);
      }
      gb.enabled=false;
      int winner= checkWinner();

      if(winner==-1){
        if(buttonList.every((p)=>p.text!="")){
          showDialog(
            context: context,
            builder: (_)=> new CustomDialog(
              "Game Tied",
              "Press the Resest Button to Start",
              resetGame,
            )
          );
        }
        else{
          activePlayer== 2? autoPlay():null;
        }
      }
    });
  }

  void autoPlay(){
    var emptyCells= new List();
    var list=new List.generate(9, (i) => i+1);
    for(var cellId in list){
      if(!(player1.contains(cellId)|| player2.contains(cellId))){
        emptyCells.add(cellId);
      }
    }
    var r=new Random();
    var randIndex= r.nextInt(emptyCells.length-1);
    var cellId=emptyCells[randIndex];
    int i=buttonList.indexWhere((p) => p.id==cellId);
    playGame(buttonList[i]);
  }

  int checkWinner(){
    var winner= -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      winner=1;
    }
    if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
      winner=1;
    }
    if(player1.contains(1) && player1.contains(5) && player1.contains(9)){
      winner=1;
    }
    if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
      winner=1;
    }
    if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
      winner=1;
    }
    if(player1.contains(3) && player1.contains(5) && player1.contains(7)){
      winner=1;
    }

    if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
      winner=1;
    }
    if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
      winner=1;
    }

    if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(5) && player2.contains(9)){
      winner=1;
    }
    if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
      winner=1;
    }
    if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
      winner=1;
    }
    if(player2.contains(3) && player2.contains(5) && player2.contains(7)){
      winner=1;
    }

    if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
      winner=1;
    }
    if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
      winner=1;
    }

    if(winner!=-1){
      if(winner==1){
        showDialog( 
          context: context,
          builder: (_)=> new CustomDialog(
            "Player 1 Won",
            "Press the reset button to start again",
            resetGame,
          )
        );
      }
      else{
        showDialog( 
          context: context,
          builder: (_)=> new CustomDialog(
            "Player 2 Won",
            "Press the reset button to start again",
            resetGame,
          )
        );

      }
    }
    return winner;
  }
  void resetGame(){
    if(Navigator.canPop(context));
    setState(() {
      buttonList=doInit();
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tic Tac Toe Game"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 9.0,
              mainAxisSpacing: 9.0,
            ),
            padding: const EdgeInsets.all(10.0),
            itemCount: buttonList.length,
            itemBuilder: (context, i) => new SizedBox(
              width: 100.0,
              height: 100.0,
              child: new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: buttonList[i].enabled
                    ? () => playGame(buttonList[i])
                    : null,
                child: new Text(
                  buttonList[i].text,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                color: buttonList[i].bg,
                disabledColor: buttonList[i].bg,
              ),
            ),
        ),
      ),
      new RaisedButton(
        child: new Text("Reset", style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        ),
        padding: const EdgeInsets.all(20.0),
        onPressed: resetGame,
      ),
    ],
      ),
    );
  }
}
