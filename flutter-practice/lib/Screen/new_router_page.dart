import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome new Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: ()
                {
                    //Navigator.pop(context);
                    context.pop();
                },
                child: const Text('Go to Back')),
            TextButton(
                onPressed: ()
                {
                  // Navigator.push(context,
                  //     MaterialPageRoute(
                  //         builder: (context)
                  //         {
                  //           return const NewPage2();
                  //         }));
                  context.pushNamed('new2');
                },
                child: const Text('go to newPage2'))
          ],
        ),
      ),
    );
  }
}


class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome new Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: ()
                {
                  //Navigator.pop(context);
                  context.pop();
                },
                child: const Text('Go to Back')),
            TextButton(
                onPressed: ()
                {
                  //Navigator.popUntil(context, (route) => route.isFirst);
                  context.goNamed('home');
                },
                child: const Text('go to Home'))

          ],
        ),
      ),
    );
  }
}