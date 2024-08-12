import 'package:flutter/material.dart';

class Caculator extends StatefulWidget {
  const Caculator({super.key});

  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  dynamic result;

  void numberTapped(int tappedNum){
    if(firstOperand ==null){
      setState(() {
        firstOperand = tappedNum;
      });
      return;
    }

    if(operator == null){
      setState(() {
        firstOperand = int.parse("$firstOperand$tappedNum");
      });
      return;
    }

    if(secondOperand == null){
      setState(() {
        secondOperand = tappedNum;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse("$secondOperand$tappedNum");
    });

  }

  void clearNumber(){
    setState(() {
      firstOperand = null;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  void operatorTapped(String tappedOperator){
    setState(() {
      operator = tappedOperator;
    });
  }

  String showText(){
    if(result != null){
      return "$result";
    }

    if(secondOperand != null){
      return "$firstOperand$operator$secondOperand";
    }

    if(operator != null){
      return "$firstOperand$operator";
    }

    if(firstOperand != null){
      return "$firstOperand";
    }

    return "0";
  }

  void calculateResult(){
    if(firstOperand == null || secondOperand == null){
      return;
    }

    if(operator == '+'){
      plusNumber();
      return;
    }

    if(operator == '-'){
      minusNumber();
      return;
    }

    if(operator == 'x'){
      multiplyNumber();
      return;
    }

    if(operator == '/'){
      divideNumber();
      return;
    }

  }

  void plusNumber(){
    setState(() {
      result = firstOperand! + secondOperand!;
    });
  }

  void minusNumber(){
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void multiplyNumber(){
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void divideNumber(){
    setState(() {
      result = firstOperand! / secondOperand!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              showText(),
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {numberTapped(7);}, child: Text('7'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(8);}, child: Text('8'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(9);}, child: Text('9'))),
              Expanded(child: TextButton(onPressed: () {operatorTapped('/');}, child: Text('/'))),
            ],
          ),
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {numberTapped(4);}, child: Text('4'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(5);}, child: Text('5'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(6);}, child: Text('6'))),
              Expanded(child: TextButton(onPressed: () {operatorTapped('x');}, child: Text('x'))),
            ],
          ),
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {numberTapped(1);}, child: Text('1'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(2);}, child: Text('2'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(3);}, child: Text('3'))),
              Expanded(child: TextButton(onPressed: () {operatorTapped('-');}, child: Text('-'))),
            ],
          ),
          Row(
            children: [
              Expanded(child: TextButton(onPressed: () {clearNumber();}, child: Text('C'))),
              Expanded(child: TextButton(onPressed: () {numberTapped(0);}, child: Text('0'))),
              Expanded(child: TextButton(onPressed: () {calculateResult();}, child: Text('='))),
              Expanded(child: TextButton(onPressed: () {operatorTapped('+');}, child: Text('+'))),
            ],
          )
        ],
      ),
    );
  }
}
