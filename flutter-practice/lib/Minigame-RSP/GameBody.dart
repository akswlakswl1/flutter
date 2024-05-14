import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/Minigame-RSP/enum.dart';
import 'package:flutter_practice/Minigame-RSP/widget/cpu_input.dart';
import 'package:flutter_practice/Minigame-RSP/widget/game_result.dart';

import 'widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput; //내부에서만 사용될때는 _를 사용해서 멤버 표시, nullable 에서는 late 없이 사용
  late InputType _cpuInput;
  
  @override
  void initState() {
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone,cpuInput : _cpuInput)),
        Expanded(child: GameResult(isDone: isDone, result : getResult(),callback: reset,)),
        Expanded(child: UserInput(isDone: isDone,callback: setUserInput,userInput: _userInput,)),
      ],
    );
  }

  void setUserInput(InputType userInput){
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }
  
  void setCpuInput(){
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(InputType.values.length)];
  }

  void reset(){
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

  Result? getResult(){
    if(_userInput ==null)
      return null;

    switch(_userInput!){
      case InputType.rock:
        switch(_cpuInput){
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch(_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
          switch(_cpuInput) {
            case InputType.rock:
              return Result.playerWin;
            case InputType.scissors:
              return Result.cpuWin;
            case InputType.paper:
              return Result.draw;
          }
    }

  }
}
