import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/main_movies/top_rated/top_rated_view.dart';
import 'package:provider/provider.dart';

import '../../movie_details/movie_details_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      if (provider.isLoadingPopular && provider.isLoadingTopRated) {
        return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
 ),
      );
      } else {
        return provider.results.isNotEmpty?
        ListView(
          children: [
            SizedBox(
              height: 300,
              child: InkWell(
                onTap:  ( ) {
                  Navigator.of(context).pushNamed(MovieDetailsView.routeName
                  , arguments: MovieModel(
                          title: provider.results[4].title??'',
                          voteAverage: provider.results[4].voteAverage??0,
                          img: provider.results[4].backdropPath??'',
                          date: provider.results[4].releaseDate??'',
                          geners: provider.genres,
                          overView: provider.results[4].overview??'')

                  );
                } ,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: FadeInImage.assetNetwork(
                            width: double.infinity,
                             fit: BoxFit.cover,
                            placeholder: 'assets/linkedinPicture2.jpg',
                            image:
                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                                '${provider.results[4].backdropPath ?? ''}',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Text(provider.results[4].title??'', style:const  TextStyle(
                                  color: Colors.white ,
                                  fontSize: 14,
                                ),
                                  textAlign: TextAlign.center,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(provider.results[4].releaseDate??'', style: const TextStyle(
                                  color: Color(0xffB5B4B4),
                                  fontSize: 10,
                                ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 200,
                        width: 129,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.fill,
                            placeholder: 'assets/linkedinPicture2.jpg',
                            image:
                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${provider.results[4].backdropPath ?? ''}',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
           width: double.infinity,
         padding: const EdgeInsets.all(15),
         decoration: const BoxDecoration(
           color: Color(0xff282A28),
         ),
           child: const Text(
             'Recommended' ,
             style: TextStyle(
               color: Colors.white,
               fontSize: 15 ,
               fontWeight: FontWeight.bold
             ),
           ),
         ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(
                color: Color(0xff282A28)
              ),
              child: SizedBox(
                  height: 220,
                  child: TopRatedView()),
            ),



          ],
        ):
      const Center(
        child: Text('No data',style: TextStyle(
          color: Colors.white,fontSize: 20
        ),),
      );
      }
    });
  }
}
