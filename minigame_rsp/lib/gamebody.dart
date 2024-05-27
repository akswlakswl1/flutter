import 'package:flutter/material.dart';
import 'package:minigame_rsp/enum.dart';
import 'package:minigame_rsp/widget/cpu_input.dart';
import 'package:minigame_rsp/widget/game_result.dart';
import 'package:minigame_rsp/widget/user_input.dart';
import 'dart:math';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput;
  late InputType _cpuInput;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone : isDone,cpuInput :_cpuInput)),
        Expanded(child: GameResult(isDone: isDone,result: getResult(), callback: reset,)),
        Expanded(child: UserInput(isDone: isDone, userInput: _userInput,callback: setUserInput)),
      ],
    );
  }

  void setUserInput(InputType userInput){
    setState(() {
        _userInput = userInput;
        isDone = true;
    });
  }
  
  void setCpuInput(){
    setState(() {
      final random = Random();
      _cpuInput = InputType.values[random.nextInt(InputType.values.length)];
    });
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
