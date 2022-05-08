// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Baye());
}

class Baye extends StatelessWidget {
  const Baye({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Dicee',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Dicee(),
      ),
    );
  }
}

class Dicee extends StatefulWidget {
  const Dicee({Key? key}) : super(key: key);

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  var last = 1;
  var lasts = 1;
  void come() {
    lasts = Random().nextInt(6) + 1;
    last = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(
                  () {
                    come();
                  },
                );
              },
              child: Image.file(
                File('C:/Users/Endale/Pictures/Dicee/dice$last.png'),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(
                  () {
                    come();
                  },
                );
              },
              child: Image.file(
                File('C:/Users/Endale/Pictures/Dicee/dice$lasts.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
