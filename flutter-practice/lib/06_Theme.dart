import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeWidget(),
    theme: cusTomTheme,
  )
  );
}

//테마를 미리 정해서 사용할 수 있다.
final cusTomTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
    bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
  ),
  useMaterial3: false,
);


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futter Theme'),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Text('tap : $count'),
            ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Image.asset('assets/images/BG.png')),
            Ink.image(
              image: AssetImage('assets/images/BG.png'),
              width: 300, // 이미지의 폭에 맞게 조절
              height: 200, // 이미지의 높이에 맞게 조절
              child: InkWell(
                onTap: () {
                  // 이미지를 누를 때 수행할 작업을 여기에 추가
                  print('이미지가 눌렸습니다!');
                },
              highlightColor: Colors.transparent, // 터치 효과의 하이라이트 색상을 투명하게 설정
              splashColor: Colors.transparent, // 터치 효과의 스플래시 색상을 투명하게 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}
