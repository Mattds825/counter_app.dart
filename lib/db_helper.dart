import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  SharedPreferences prefs;

  Database() {
    init();
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void addCounter(int index){
    prefs.setString(index.toString(), '0');
  }

  void addToCounter(int index){
    prefs.setString(index.toString(), (int.parse(prefs.getString(index.toString()))+1).toString());
  }

  void subtractFromCounter(int index){
    prefs.setString(index.toString(), (int.parse(prefs.getString(index.toString()))-1).toString());
  }

  int getCounterNum(int index){
    return int.parse(prefs.getString(index.toString()));
  }
}
