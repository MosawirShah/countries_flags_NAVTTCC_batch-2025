import 'dart:convert';

class FlagModel {
  bool error;
  String msg;
  List<Data> data;

  FlagModel({required this.error, required this.msg, required this.data});

  factory FlagModel.fromJson(Map<String, dynamic> jsonObj) {
    return FlagModel(
        error: jsonObj['error'],
        msg: jsonObj['msg'],
        data: (jsonObj['data'] as List).map((mapObj)=>Data.fromJson(mapObj)).toList());
  }
}

class Data{
  String name;
  String flag;
  String iso2;
  String iso3;

  Data({required this.name, required this.flag, required this.iso2, required this.iso3});

  factory Data.fromJson(Map<String,dynamic> jsonObj){
    return Data(name: jsonObj['name'], flag: jsonObj['flag'], iso2: jsonObj['iso2'], iso3: jsonObj['iso3']);
  }
}
