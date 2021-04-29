import 'package:flutter/material.dart';
import 'package:lingo_app/utils/letter_box.dart';

class Lingo {

  List<LetterBox> boxes;
  String _word;
  int _guessNo = 0;
  int gameStatus = 0;

  Lingo(String word){
    this._word = word;
    boxes = List<LetterBox>();
    for (int i = 0; i < 25; i++){
      if (i % 5 == 0)
        boxes.add(LetterBox(word[0], Colors.lightBlue));
      else
        boxes.add(LetterBox('', Colors.lightBlueAccent));
    }
  }

  get word {
    return _word;
  }

  get guessNo {
    return _guessNo;
  }

  get firstLetter {
    return _word[0];
  }

  void guessWord (String guess){
    if(guess==_word)
      gameStatus=1;

    List<String> lettersFound = List<String>();
    int a= _guessNo*5+1;
    int b= (_guessNo+1)*5;

    for (int i=a; i<b; i++){
      boxes[i].setLetter(guess[i-5*_guessNo]);
      if(boxes[i].letter==_word[i-5*_guessNo]) {
        boxes[i].setColor(Colors.redAccent);
        lettersFound.add(boxes[i].letter);
      }
    }

    for (int i=a; i<b; i++){
      int occurrences = 0;
      lettersFound.forEach((e) {
        if (e == boxes[i].letter)
          occurrences++;
      });
      for(int j=1; j<5;j++){
        if(boxes[i].letter==_word[j]&&boxes[i].color!=Colors.redAccent && occurrences < boxes[i].letter.allMatches(_word).length) {
          boxes[i].setColor(Colors.yellowAccent);
          lettersFound.add(boxes[i].letter);
        } else if(boxes[i].color!=Colors.redAccent && boxes[i].color!=Colors.yellowAccent)
          boxes[i].setColor(Colors.lightBlueAccent);
      }
    }
    _guessNo++;
    if(gameStatus!=1&& _guessNo==5)
      gameStatus=-1;
    return;
  }

}