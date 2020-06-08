import 'package:counters/constants.dart';
import 'package:counters/counter_widget.dart';
import 'package:flutter/cupertino.dart';

class Counter{

  int id;
  Widget counterWdiget;
  int countAmount = 0;
  ColorMode colorMode;

  Counter(this.id,this.colorMode){
    counterWdiget = CounterWidget(counterClass: this,colorMode: colorMode,);
  }

  Widget getCounterWidget(){
    return counterWdiget;
  }

}
