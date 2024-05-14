import 'package:flutter/material.dart';
import 'package:flutter_practice/Screen/new_router_page.dart';
import 'package:go_router/go_router.dart';





//Go 라우터 라이브러리 통해서 화면 전환
//GoNamed 하면 바로 이동
//PushNamed 사용하면 나중에 Pop으로 다시 back 가능함
void main(){
  runApp(
      MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
          //미리 등록해둠
          GoRoute(path: '/',name: 'home',builder: (context,_)=>const HomeWidgetRouter()),
          GoRoute(path: '/new',name: 'new',builder: (context,_)=> const NewPage()),
          GoRoute(
              path: '/new2',
              name: 'new2',
              builder: (context,_)=>const NewPage2(),
            routes: [
              //하위 경로도 추가해서 관리가 가능함
            ]
          ),
        ]
      ),
    )
  );
}

// void main() {
//   runApp(MaterialApp(
//     title: 'app Name',
//     theme: ThemeData(
//       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
//       useMaterial3: true,
//     ),
//     home: const HomeWidgetRouter()
//   ));
// }

//라우터 기능 사용해서 페이지 이동
class HomeWidgetRouter extends StatelessWidget {
  const HomeWidgetRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('basicRouter'),
        //저장된 ThemeColor를 불러와서 적용
        backgroundColor: ThemeData().colorScheme.primary,
      ),
      body: Center(
        child: TextButton(
          child: const Text('Go to page'),
          onPressed: ()
          {
            // Navigator.push(context,
            //     MaterialPageRoute(
            //         builder: (context)
            //         {
            //           return const NewPage();
            //         }));
            print(1);
            context.pushNamed('new');
          },
        ),
      ),
    );
  }
}





//단순 화면이동
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late int index;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tit111le'),
        //저장된 ThemeColor를 불러와서 적용
        backgroundColor: ThemeData().colorScheme.primary,
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            activeIcon: Icon(Icons.home_max)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              activeIcon: Icon(Icons.search_outlined)
          )
        ],
        currentIndex: index,
        onTap: (_index) => setState(() {
          index = _index;
        }),
      ),
    );
  }

  Widget HomeBody(){
      switch(index){
        case 1:
          return const Center(child: Icon(Icons.icecream,size: 100,));
        case 2:
          return const Center(child: Icon(Icons.person_2,size: 100,));
        case 0:
          //return const Center(child: Icon(Icons.home,size: 100,));
          return Center(child: Image.asset(bg));
        default:
          return const Center(child: Icon(Icons.home,size: 100,));

      }
  }

}

//로컬 이미지를 사용하기 위해서는 yaml에 asset에 폴더 경로 세팅해줘야 한다.
const assetImagePath = 'assets/images/';
const bg = '$assetImagePath/BG.png';
class GetLoaclImage extends StatelessWidget {
  const GetLoaclImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(bg),
    );
  }
}
