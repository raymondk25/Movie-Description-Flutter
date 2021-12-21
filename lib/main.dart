import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/text.dart';
import 'package:flutter_movie/widgets/top_rated.dart';
import 'package:flutter_movie/widgets/trending.dart';
import 'package:flutter_movie/widgets/tv_shows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String apiKey = 'de5f613e6c87469011b27a6ebf9e0401';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTVmNjEzZTZjODc0NjkwMTFiMjdhNmViZjllMDQwMSIsInN1YiI6IjYxYzAwNzZhZDJmNWI1MDA0MWJhZTNkYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6aDp8Ptd4uPHMhsskJr9Kem8j6aSVJqXFZpYzH6jUbg';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvShows = tvShowsResult['results'];
    });
    print(trendingResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: 'MOMOVIE', color: Colors.red, size: 24),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: ListView(
          children: [
            TvShows(tvShows: tvShows),
            TrendingMovies(trending: trendingMovies),
            TopRated(topRated: topRatedMovies),
          ],
        ),
      ),
    );
  }
}
