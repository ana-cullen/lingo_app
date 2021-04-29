import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lingo_app/pages/game_page.dart';

class LandingPage extends StatefulWidget{

  @override
  State createState() => new LandingPageState();

}
class LandingPageState extends State<LandingPage>{

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rules'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The goal of the game is to guess a word given the first letter.'),
                Text('You have five chances to guess what the word is.'),
                Text('You should guess real words.'),
                Text('If a letter in the word you guess is in the right place it appears in red.'),
                Text('If a letter in the word you guess is in the word but in the wrong place it appears in yellow.')
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlueAccent,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, right: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                  ),
                  child: FlatButton(
                    onPressed: () {
                      _showMyDialog();
                    },
                    child: Text(
                      "Rules",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                )
              )
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome to ",
                style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold),
              ),
              Text(
                "Lingo!",
                style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              FlatButton(
                  padding: EdgeInsets.only(top: 25.0),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> new GamePage())),
                  child: Text(
                    "Let's play!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        decoration: TextDecoration.underline
                    ),
                  )
              )
            ],
          ),
        ],
      )
    );
  }
}