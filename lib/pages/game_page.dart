import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'win_lose_page.dart';
import 'package:lingo_app/utils/lingo.dart';
import '../view_sections/letter_boxes.dart';

class GamePage extends StatefulWidget {
  @override
  State createState() => new GamePageState();
}

class GamePageState extends State<GamePage> {
  bool loaded = false;
  Lingo game;
  var words;

  Future<void> _showMyDialog() async {
    TextEditingController guessController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: guessController,
            decoration: InputDecoration(
              hintText: game.firstLetter+"...."
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Enter'),
              onPressed: () {
                game.guessWord(guessController.text);
                setState(() {
                  LetterBoxes(game);
                });
                print(game.guessNo);
                Navigator.of(context).pop();
                if(game.gameStatus!=0)
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context)=> new WinLosePage(game.gameStatus, game.word)
                      )
                  );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/five_letter_words.txt').then((value) {
      words = value.split('\n');
      String word = words[Random().nextInt(words.length)];
      setState(() {
        game = Lingo(word);
        loaded = true;
      });
      print(game.word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: !loaded
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LetterBoxes(game),
                  FlatButton(
                      onPressed: () => this._showMyDialog(),
                      child: Text(
                        "Guess",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20.0,
                            color: Colors.white
                        )
                      )
                  ),
                ],
              )
            ),
    );
  }
}
