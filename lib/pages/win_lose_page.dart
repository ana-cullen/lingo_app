import 'package:flutter/material.dart';
import 'game_page.dart';
import 'landing_page.dart';

class WinLosePage extends StatelessWidget{

  final int gameStatus;
  final String gameWord;

  WinLosePage(this.gameStatus, this.gameWord);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: this.gameStatus==1 ? Colors.greenAccent : Colors.redAccent,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    this.gameStatus==1 ? "You guessed correctly!" : "You couldn't guess the word",
                  style: TextStyle(fontSize: 25.0,color: Colors.white)
                ),
                SizedBox(height: 10,),
                Text(
                    "The word was: ",
                    style: TextStyle(fontSize: 20.0,color: Colors.white)
                ),
                Text(
                    gameWord,
                    style: TextStyle(fontSize: 30.0,color: Colors.white)
                ),
                SizedBox(height: 15,),
                RaisedButton(
                  child: Text("New Game"),
                  onPressed:  () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> new GamePage())),
                ),
                RaisedButton(
                  child: Text("Home"),
                  onPressed:  () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> new LandingPage())),
                )
              ],
            ),
          )
        )
    );
  }
}