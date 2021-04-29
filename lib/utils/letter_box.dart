import 'package:flutter/material.dart';

class LetterBox {
  String _letter;
  Color _color;

  LetterBox(this._letter, this._color);

  get letter {
    return _letter;
  }

  void setLetter(String l){
    _letter=l;
  }

  get color {
    return _color;
  }

  void setColor(MaterialAccentColor c) {
    _color=c;
  }
}