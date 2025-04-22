import 'package:countries_flag_via_api/flag_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CountriesFlag());
}

class CountriesFlag extends StatelessWidget {
  const CountriesFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.purple,
        ),
        scaffoldBackgroundColor: Colors.purple[100],

      ),
      debugShowCheckedModeBanner: false,
      home: FlagScreen(),
    );

  }
}
