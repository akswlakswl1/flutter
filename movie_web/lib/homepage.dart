import 'package:flutter/material.dart';
import 'package:movie_web/widget/icon_searchbar.dart';
import 'package:movie_web/widget/main_daawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Iconsearchbar(),
      drawer: const MainDrawer(),
      body: Center(
        child: Text('Movie site'),
      ),
    );
  }
}
