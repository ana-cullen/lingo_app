import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:lingo_app/utils/lingo.dart';
import 'dart:ui';

import 'package:lingo_app/utils/letter_box.dart';

class LetterBoxes extends StatefulWidget{

  final Lingo game;

  LetterBoxes(this.game);

  @override
  State createState() => new LetterBoxesState();

}

class LetterBoxesState extends State<LetterBoxes>{

  Widget letterBox(LetterBox box) {
    return Container(
      width: 65.0,
      height: 65.0,
      child: Center(
        child: BorderedText(
          strokeWidth: 3.0,
          child: Text(
          box.letter,
          style: TextStyle(color: Colors.white, fontSize: 40.0,decoration: TextDecoration.none, decorationColor: Colors.black),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: box.color,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0)
          )
      ),
    );
  }

  Widget boxRow(List<LetterBox> letterBoxes){
    return Row(
      children: <Widget>[
        Spacer(),
        letterBox(letterBoxes[0]),
        Spacer(),
        letterBox(letterBoxes[1]),
        Spacer(),
        letterBox(letterBoxes[2]),
        Spacer(),
        letterBox(letterBoxes[3]),
        Spacer(),
        letterBox(letterBoxes[4]),
        Spacer(),
      ],
    );
  }

  Widget boxGrid(Lingo game){
    List<LetterBox> boxes = game.boxes;
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        boxRow(boxes.sublist(0, 5)),
        SizedBox(height: 5),
        boxRow(boxes.sublist(5, 10)),
        SizedBox(height: 5),
        boxRow(boxes.sublist(10, 15)),
        SizedBox(height: 5),
        boxRow(boxes.sublist(15, 20)),
        SizedBox(height: 5),
        boxRow(boxes.sublist(20, 25)),
        SizedBox(height: 5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return boxGrid(widget.game);
  }

}