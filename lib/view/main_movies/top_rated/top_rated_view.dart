import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/main_movies/top_rated/top_rated_widget.dart';
import 'package:movies_app/view/movie_details/movie_details_screen.dart';
import 'package:provider/provider.dart';

class TopRatedView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      return ListView.separated(itemBuilder:  (ctx, index) {
        return SizedBox(
          height: 189,
          width: 100,
          child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                spreadRadius: 4
              ),
            ]
          ),
            child: InkWell(
              onTap: ( ) {
                provider.movieID = provider.resultsTopRated[index].id??0;
                 Provider.of<ApiManager>(context,listen: false).getSimilarMovies(1,provider.movieID??278 );
                Navigator.of(context).pushNamed(MovieDetailsView.routeName ,
                arguments: MovieModel(
                    title: provider.resultsTopRated[index].title??'',
                    voteAverage:  provider.resultsTopRated[index].voteAverage??0,
                    img:  provider.resultsTopRated[index].backdropPath??'',
                    date:  provider.resultsTopRated[index].releaseDate??'',
                    geners:  provider.genres,
                    overView: provider.resultsTopRated[index].overview??'')
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TopRatedWidget('https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                      '${provider.resultsTopRated[index].backdropPath ?? ''}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.star,
                      color: Color(0xffFFBB3B),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${provider.resultsTopRated[index].voteAverage}',
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      ),

                    ],
                  ),
                  Text(provider.resultsTopRated[index].title??'',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10
                  ),

                  ),
                  Text(provider.resultsTopRated[index].releaseDate??'',
                  style: const TextStyle(
                    color: Color(0xffB5B4B4),
                    fontSize: 10
                  ),
                    textAlign: TextAlign.start,

                  ),
                ],
              ),
            ),
          ),
        );
      },
        itemCount: provider.resultsTopRated.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (ctx,index){
        return const SizedBox(
          width: 15,
        );
        },


      );
    });
  }
}
