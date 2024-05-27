import 'package:flutter/material.dart';
import 'package:minigame_rsp/enum.dart';

class InputCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? callback;

  const InputCard({
    super.key,
    required this.child,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: InputContent(child: child,),
      onTap: ()=> callback?.call(),
    );
  }
}

class InputContent extends StatelessWidget {
  final Widget child;
  const InputContent({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey,width: 8),
      ),
      child: child,
    );
  }
}
