import 'package:flutter/material.dart';
import 'package:flutter_practice/Minigame-RSP/enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult(
      {required this.isDone, super.key, this.result, required this.callback});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result!.displayString,
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 8),
          TextButton(
              child: const Text('Restart', style: TextStyle(fontSize: 30)),
              onPressed: () => callback.call())
        ],
      );
    }

    return const Center(
      child: Text(
        '가위, 바위, 보 중 하나를 선택 해 주세요.',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
