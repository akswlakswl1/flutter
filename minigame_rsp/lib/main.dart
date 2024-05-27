import 'package:flutter/material.dart';
import 'package:minigame_rsp/gamebody.dart';

/*
 * 1. 화면을 3등분한다
 * 2. 맨 위는 랜덤으로 결과가 나온다
 * 3. 가운데는 텍스트로 상황을 설명한다
 * 4. 하단은 가위, 바위, 보 선택 사항을 만들어 준다.
 *
 */


void main() {
  runApp(const RSPApp());
}

class RSPApp extends StatelessWidget {
  const RSPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '가위 바위 보!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const GameBody(),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
    );
  }
}
