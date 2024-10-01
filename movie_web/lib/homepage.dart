import 'package:flutter/material.dart';
import 'package:movie_web/data/movie_data.dart';
import 'package:movie_web/model/movie_model.dart';
import 'package:movie_web/skeleton_loading/carousel_skeleton.dart';
import 'package:movie_web/skeleton_loading/now_skeleton.dart';
import 'package:movie_web/skeleton_loading/popular_skeleton.dart';
import 'package:movie_web/widget/footer.dart';
import 'package:movie_web/widget/icon_searchbar.dart';
import 'package:movie_web/widget/main_daawer.dart';
import 'package:movie_web/widget/main_widget/main_carousel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<MovieModel> _topratedMovie = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });

  }

  getMovieData() async{
    var data = MovieData();
    _topratedMovie = await data.fetchTopRatedMovie();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Iconsearchbar(),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Top rated movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: isLoading ? const CarouselSkeleton() : MainCarouselSlider(topratedMovies: _topratedMovie),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Now Playing",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NowSkeleton(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Explore popular movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(builder: (context, constraints) {
                double gridviewHeight = (constraints.maxWidth / 5) * 1.3 * 4;
                return SizedBox(
                  height: gridviewHeight,
                  child: const PopularSkeleton(),
                );
              }),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
