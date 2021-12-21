import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerURL, launchDate;
  final double vote;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerURL,
      required this.vote,
      required this.launchDate,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(padding: EdgeInsets.only(left: 10), child: ModifiedText(text: name!=null?name:'Not Loaded', size: 24,),),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(padding: EdgeInsets.all(10), child: ModifiedText(text: '⭐ '+ vote.toString(), size: 16,),),

                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(alignment: Alignment.centerRight,padding: EdgeInsets.only(right: 10), child: ModifiedText(text: 'Release Date: ' + launchDate,),),
            Container(padding: EdgeInsets.only(left: 10), child: ModifiedText(text: 'Overview', size: 20, fontWeight: FontWeight.bold,),),
            Container(padding: EdgeInsets.all(10), child: ModifiedText(text: description, size: 16,),),
          ],
        ),
      ),
    );
  }
}
