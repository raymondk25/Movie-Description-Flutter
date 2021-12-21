import 'package:flutter/material.dart';
import 'package:flutter_movie/description.dart';
import 'package:flutter_movie/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', size: 26),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Description(name: trending[index]['title'], description: trending[index]['overview'], bannerURL: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'], vote: trending[index]['vote_average'], launchDate: trending[index]['release_date'],)));
                    },
                    child: trending[index]['title']!=null?Container(
                      padding: EdgeInsets.only(top: 8),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'])),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: ModifiedText(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading'),
                          ),
                        ],
                      ),
                    ):Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
