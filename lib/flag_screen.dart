import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'flag_model.dart';

class FlagScreen extends StatelessWidget {
   FlagScreen({super.key});


   Future<FlagModel> getFlagsData()async{
     final flagUrl =  Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images');
      final response = await http.get(
          flagUrl);
      var data = jsonDecode(response.body);
      if(response.statusCode == 200){
       return FlagModel.fromJson(data);
      }else{
        return FlagModel.fromJson(data);
      }
   }


  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
          future: getFlagsData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }else{
              return ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (contex, index){
                    return Container(
                      margin: EdgeInsets.all(8),
                      height: 250,
                      color: Colors.purple.shade300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: SvgPicture.network(snapshot.data!.data[index].flag.toString(),fit: BoxFit.cover,),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            child: Center(child: Text(snapshot.data!.data[index].name.toString(),style: TextStyle(fontSize: 18,),)),
                          ),
                        ],
                      ),
                    );
                  });
            }
      }),
    );
  }
}
