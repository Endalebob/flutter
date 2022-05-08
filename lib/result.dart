import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_file.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.message, this.result, this.inter);
  String? message;
  String? result;
  String? inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Expanded(
              child: Text(
                "YOUR RESULT",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: best,
              oso: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    message.toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 228, 93), fontSize: 22),
                  ),
                  Text(
                    result.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    inter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: bottomHeight,
              width: double.infinity,
              color: bottomColor,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
