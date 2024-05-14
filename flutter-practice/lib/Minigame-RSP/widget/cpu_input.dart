import 'package:flutter/material.dart';
import 'package:flutter_practice/Minigame-RSP/enum.dart';
import 'package:flutter_practice/Minigame-RSP/widget/input_card.dart';

class CpuInput extends StatelessWidget {
  final bool isDone;
  final InputType cpuInput;

  const CpuInput({super.key, required this.isDone, required this.cpuInput});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SizedBox.shrink()), //빈 공간을 만들어 주고 싶을때 사용
        Expanded(
          child: InputCard(
              child: getCpuInput(),
          ),
        ),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }

  Widget getCpuInput(){
    if(isDone){
      return Image.asset(cpuInput.path);
    }

    return const SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Text(
            '?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        )
    );
  }
}
