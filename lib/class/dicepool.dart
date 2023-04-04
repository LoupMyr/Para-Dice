import 'dart:io';

import 'package:para_dice/class/dice.dart';

class DicePool {
  int _nbDice = 1;
  List<int> _result = [];
  List<Dice> _listDice = [Dice(6)];
  List<String> _listMoyennes = [];
  int _nbFace = 6;

  DicePool();

  void setNbDice(int value) {
    this._nbDice = value;
    createListDice();
  }

  void setNbFace(int value) {
    this._nbFace = value;
    createListDice();
  }

  int getNbDice() {
    return this._nbDice;
  }

  int getNbFace() {
    return this._nbFace;
  }

  List<int> getResult() {
    return this._result;
  }

  List<String> getListMoyennes() {
    return this._listMoyennes;
  }

  List<Dice> getListDice() {
    return this._listDice;
  }

  void incrNbDice(int value) {
    this._nbDice = this._nbDice + value;
    createListDice();
  }

  void decrNbDice(int value) {
    this._nbDice = this._nbDice - value > 0 ? this._nbDice - value : 1;
    createListDice();
  }

  void incrNbFace(int value) {
    this._nbFace = this._nbFace + value;
    createListDice();
  }

  void decrNbFace(int value) {
    this._nbFace = this._nbFace - value > 6 ? this._nbFace - value : 6;
    createListDice();
  }

  void lancerPool() {
    this._result.clear();
    if (this._listDice.isNotEmpty) {
      for (Dice dice in this._listDice) {
        dice.lanceDe();
        this._result.add(dice.getResult());
      }
    }
  }

  void createListDice() {
    this._listDice.clear();
    for (int i = 0; i < this._nbDice; i++) {
      _listDice.add(new Dice(this._nbFace));
    }
    print(this._listDice);
  }

  String getMoyenne() {
    int result = 0;
    for (int i = 0; i < this._result.length; i++) {
      result = result + this._result[i];
    }
    String moy = (result / this._result.length).toStringAsFixed(1);
    this._listMoyennes.add(moy);
    return moy;
  }
}
