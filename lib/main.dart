import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0a0e21),
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xff0a0e21),
        ),
      ),
      home: InputPage(),
      
    );
  }
}
