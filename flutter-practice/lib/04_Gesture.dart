import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//UI에서 활용되는 제스쳐들

void main() {
  runApp(MaterialApp(
    title: 'app Name',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      useMaterial3: true,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('tit111le'),
        //저장된 ThemeColor를 불러와서 적용
        backgroundColor: ThemeData().colorScheme.primary,
      ),
      body: Column(
        children: [
          TestCallback(),
          TestPopupMenu(),
          TestSwitch(),
          TestSlider(),
          TestRadioButton(),
          TestCheckBox(),
        ],
      ),
    ),
  ));
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    values = [false,false,false];
  }

  Widget build(BuildContext context) {
    return Row(
      children: [                            //isCheck?? false => null이면 flase를 반환 아니면 isCheck를 반환
        Checkbox(value: values[0], onChanged: (isCheck) => ChangeValue(0, isCheck?? false)),
        Checkbox(value: values[1], onChanged: (isCheck) => ChangeValue(1, isCheck?? false)),
        Checkbox(value: values[2], onChanged: (isCheck) => ChangeValue(2, isCheck?? false)),
      ],
    );
  }


  void ChangeValue(int index, bool value)
  {
    setState(() {
      values[index] = value;
    });
  }
}




class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  eTestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('select = ${selectValue}'),
      ListTile(
        leading: Radio<eTestValue>(
          value: eTestValue.test1,
          groupValue: selectValue,
          onChanged: (value) => setState(() {
            selectValue = value;
          }),
        ),
        title: Text(eTestValue.test1.name),
        onTap: () => setState(() {
          if (selectValue != eTestValue.test1) selectValue = eTestValue.test1;
        }),
      ),
      Radio<eTestValue>(
          value: eTestValue.test2,
          groupValue: selectValue,
          onChanged: (value) => setState(() => selectValue = value!)),
      Radio<eTestValue>(
          value: eTestValue.test3,
          groupValue: selectValue,
          onChanged: (value) => setState(() => selectValue = value!)),
    ]);
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('value : ${value.round()}'),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
          divisions: 5,
          max: 100,
          min: 0,
          label: value.round().toString(),
          // activeColor: Colors.red,
        )
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;
  bool cuperValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('result = ${value}'),
        Switch(
            value: value,
            onChanged: (newValue) => setState(() {
                  value = newValue;
                })),
        Text('result = ${cuperValue}'),
        CupertinoSwitch(
            value: cuperValue,
            onChanged: (newValue) => setState(() {
                  cuperValue = newValue;
                }))
      ],
    );
  }
}

enum eTestValue { test1, test2, test3 }

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  eTestValue selectValue = eTestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return eTestValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() {
            selectValue = newValue;
          }),
        )
      ],
    );
  }
}

//Stateful에서 바로 콜백을 만들어서 사용할 수도 있지만
//StateLess에 콜백을 넘겨서 사용할 수도 있다.
class TestCallback extends StatefulWidget {
  const TestCallback({super.key});

  @override
  State<TestCallback> createState() => _TestCallbackState();
}

class _TestCallbackState extends State<TestCallback> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Count: $value',
        style: TextStyle(fontSize: 30),
      ),
      // TextButton(onPressed: ()=>{
      //   AddCounter(1)
      // }, child: Center(child: Text('Press Here')))
      TestButton(AddCounter)
    ]);
  }

  void AddCounter(int add) {
    setState(() {
      value += add;
    });
  }
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: GestureDetector(
        onTap: () => {callback.call(1)},
        onDoubleTap: () => {callback.call(2)},
        onLongPress: () => {callback.call(3)},
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all(), color: Colors.red),
            child: Text(
              'Up Counter',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
