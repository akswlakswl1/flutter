import 'package:flutter/material.dart';
import 'package:flutter_practice/Minigame-RSP/GameBody.dart';

void main(){
  runApp(const RSPApp());
}

class RSPApp extends StatelessWidget {
  const RSPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('가위 바위 보!'),
            backgroundColor: Colors.blue
        ),
        body: const GameBody(),
      ),
    );
  }
}
