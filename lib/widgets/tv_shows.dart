import 'package:flutter/material.dart';
import 'package:flutter_movie/description.dart';
import 'package:flutter_movie/utils/text.dart';

class TvShows extends StatelessWidget {
  final List tvShows;

  const TvShows({Key? key, required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Popular TV Shows Movies', size: 26),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tvShows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Description(name: tvShows[index]['title'], description: tvShows[index]['overview'], bannerURL: 'https://image.tmdb.org/t/p/w500' + tvShows[index]['backdrop_path'], vote: tvShows[index]['vote_average'], launchDate: tvShows[index]['release_date'],)));
                    },
                    child: tvShows[index]['original_name']!=null?Container(
                      padding: EdgeInsets.only(right: 10, top: 8),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvShows[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                                text: tvShows[index]['original_name'] != null
                                    ? tvShows[index]['original_name']
                                    : 'Loading'),
                          ),
                        ],
                      ),
                    ):Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
