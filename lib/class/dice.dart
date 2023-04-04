import 'dart:math';

class Dice{
  int _nbFace = 6;
  int _result = 0;

  Dice(this._nbFace);

  void lanceDe(){
    this._result = Random().nextInt(this._nbFace) + 1;
  }

  int getResult(){
    return this._result;
  }

  int getNbFace(){
    return this._nbFace;
  }

}