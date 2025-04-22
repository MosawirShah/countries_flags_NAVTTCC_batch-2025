import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlagScreen extends StatelessWidget {
   FlagScreen({super.key});


   getFlagsData()async{
     final flagUrl =  Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images');
      final response = await http.get(flagUrl);
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        print(data);
      }
   }


  @override
  Widget build(BuildContext context) {
     getFlagsData();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flags"),
            Icon(Icons.flag)
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
