import 'package:flutter/material.dart';
import 'package:flutter_movie/description.dart';
import 'package:flutter_movie/utils/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top Rated Movies', size: 26),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Description(name: topRated[index]['title'], description: topRated[index]['overview'], bannerURL: 'https://image.tmdb.org/t/p/w500' + topRated[index]['backdrop_path'],  vote: topRated[index]['vote_average'], launchDate: topRated[index]['release_date'],)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 8),
                      width: 140,
                      child: topRated[index]['title'] != null?Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topRated[index]['poster_path'])),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: ModifiedText(
                                text: topRated[index]['title'] != null
                                    ? topRated[index]['title']
                                    : 'Loading'),
                          ),
                        ],
                      ):Container(),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
