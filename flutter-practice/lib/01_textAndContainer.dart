import 'package:flutter/material.dart';

// MaterialApp은 플루터에서 애플리케이션의 최상위 레벨 위젯
// 이 위젯은 애플리케이션의 전체적인 구조를 정의하며, 다양한 설정 및 속성을 제공합니다.
// 주로 다음과 같은 역할을 수행합니다:
//
// 애플리케이션의 기본 구성: 앱의 이름, 테마, 언어 등과 같은 기본 속성을 설정
// 루트 위젯 지정: home 속성을 사용하여 애플리케이션의 첫 화면에 표시할 위젯을 지정
// 테마 설정: theme 속성을 사용하여 애플리케이션의 전반적인 디자인을 Material Design에 따라 설정
// 라우팅 및 네비게이션 관리: routes 및 navigator를 통해 화면 간 전환 및 네비게이션을 관리
//
// Scaffold는 플루터에서 애플리케이션의 기본적인 구조를 정의하는 위젯 중 하나입니다. Material Design에 따라 구성된 앱의 기본 레이아웃을 생성하며, 앱의 상단 바 (AppBar), 바텀 바 (BottomNavigationBar), 드로어 (Drawer) 등과 같은 기본적인 구성 요소를 제공합니다. Scaffold는 주로 애플리케이션의 각 화면을 나타내는 데 사용되며, UI의 기본 뼈대를 형성합니다.
// Scaffold 위젯의 몇 가지 주요 속성과 구성 요소에 대해 알아보겠습니다:
// AppBar: appBar 속성을 사용하여 상단 바를 정의합니다. 상단 바는 화면 상단에 위치하며, 제목이나 액션 버튼 등을 포함할 수 있습니다.
// Body: body 속성은 현재 화면에 나타낼 내용을 정의합니다. 이 부분에는 주로 다양한 위젯이나 컨텐츠가 들어갑니다.
// FloatingActionButton: floatingActionButton 속성을 사용하여 화면에 부가적인 동작을 수행하는 플로팅 액션 버튼을 추가할 수 있습니다.
// BottomNavigationBar: bottomNavigationBar 속성을 사용하여 화면 하단에 탐색을 위한 바텀 바를 추가할 수 있습니다.
// Drawer: drawer 속성을 사용하여 화면 좌측에서 나타나는 드로어(네비게이션 메뉴 등)를 추가할 수 있습니다.
//
//Text
//TextStyle 메서드 안에서 텍스트를 관리할 수 있다.

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
      body: TestContainer(),
    ),
  ));
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text(
          'Grace Great',
          style: TextStyle(
            fontSize: 45,
            color: Colors.blue,
          ),
        ));
  }
}

//Container 테두리를 정하고 그 안에 원하는 컨텐츠를 넣을 수 있다.
//Container는 크기를 잡아주는 위젯으로 감싸주어야한다.
//margin: 바깥여백 EdgeInsets.all(30)
// padding: 안쪽여백 EdgeInsets.fromLTRB(10, 20, 30, 40),
//Row(), Column() 이런덴 안되고 Container() 에만 여백을 줄 수 있다.
//컨테이너는 하나의 차일드를 가질 수 있다.
class TestContainer extends StatelessWidget {
  const TestContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Container(
        width: 300,//double.infinity,
        height:300,
        color: Colors.green,
        child: Align(
          //child에 Container를 바로사용하면 겹쳐서 보임
          alignment: Alignment.center,
          child: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.yellow,width: 5,style: BorderStyle.solid),

            ),
            child: Center(child: Text('1211231231233')),
                ),
        ),
      )
    );
  }
}

