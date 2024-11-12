import 'package:flutter/material.dart';

class RamStorageNotifier with ChangeNotifier{
  String _ram="";
  String get ram => _ram;

  void setRam(String r){
    if (_ram==r ){
      _ram = "";
    }else {
      _ram = r;
    }
    _ram = ram;
    notifyListeners();
  }
  String _storage="";
  String get storage => _storage;

  void setstorage(String s){
    if (_storage==s ){
      _storage = "";
    }else {
      _storage= s;
    }
    _storage = storage;
    notifyListeners();
  }
}