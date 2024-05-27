import 'package:flutter/material.dart';
import 'package:minigame_rsp/enum.dart';
import 'package:minigame_rsp/widget/input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput({super.key,required this.isDone, required this.callback ,this.userInput});

//우선은 강의 들은대로 따라 해보자
  @override
  Widget build(BuildContext context) {
    if(isDone){
      return Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          const Expanded(child: SizedBox.shrink()),
        ],
      );
    }

    return Row(
      children: _getInputs(),
    );
  }

  List<Widget> _getInputs(){
    return InputType.values.map((type) => Expanded(
      child: InputCard(
        child: Image.asset(type.path),
        callback: () => callback.call(type),
      ),
    )).toList();
  }
}


