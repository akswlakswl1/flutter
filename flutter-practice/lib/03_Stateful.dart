import 'package:flutter/material.dart';

//Stateless Widget Lifecycle
//Create -> build() -> dispose

//Stateful Widget Lifecycle
//Cteate -> Cteate State<Widget> -> InitState() -> build() -> deactivate -> dispose() -> Dispose
//                                                  ㄴ> SetState()
//상태관리가 복잡하기 때문에 여러 상태관리 모델이 오픈소스로 개발되어 공유되고 있다.
//Riverpod, BLoc, GetX, Provider, Redux...


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
        children: [MakeStateless(), MakeStateful()],
      ),
    ),
  ));
}

//변화 없이 고정으로 사용할 때
class MakeStateless extends StatelessWidget {
  const MakeStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.cyan,
        ));
  }
}

//별도의 스테이트 객체를 통해서 위젯의 색, 형태를 바꿀 수 있음
class MakeStateful extends StatefulWidget {

  const MakeStateful({super.key});

  @override
  State<MakeStateful> createState() => _MakeStatefulState();
}

class _MakeStatefulState extends State<MakeStateful> {
  late int _index;
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = 5;
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: (){
          setState(() {
            _index++;
            // print('touch');
          });
        },
        child: Container( //여기 부분에 제스쳐 감지

          child: Center(
            child: Text(
              '$_index touch!',
              style: TextStyle(
                backgroundColor: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
