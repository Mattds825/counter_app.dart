import 'package:counters/constants.dart';
import 'package:counters/counter_widget.dart';
import 'package:flutter/cupertino.dart';

class Counter {
  int id;
  CounterWidget counterWdiget;
  int countAmount = 0;
  ColorMode colorMode = ColorMode.black;

  Counter() {
    counterWdiget = CounterWidget(
      counterClass: this,
      colorMode: colorMode,
    );
  }


  Counter.map(dynamic obj) {
    this.id = obj['id'];
    this.countAmount = obj['countAmount'];
    counterWdiget = CounterWidget(
      counterClass: this,
      colorMode: colorMode,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] ?? id;
    map['countAmount'] = countAmount;
    return map;
  }

  Counter.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.countAmount = map['countAmount'];
  }

  Widget getCounterWidget() {
    return counterWdiget;
  }

  void setColor(ColorMode mode){
    colorMode = mode;
  }
}
