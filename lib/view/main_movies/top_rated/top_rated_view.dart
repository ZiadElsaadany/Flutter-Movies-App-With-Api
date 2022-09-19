import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/main_movies/top_rated/top_rated_widget.dart';
import 'package:movies_app/view/movie_details/movie_details_screen.dart';
import 'package:provider/provider.dart';

class TopRatedView extends StatelessWidget {
  bool check;

  TopRatedView({this.check = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      return ListView.separated(
        itemBuilder: (ctx, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 2, spreadRadius: 4),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsView(
                              provider.resultsTopRated[index].id!.toInt(),
                            ),
                          ),
                        );
                      },
                      child: TopRatedWidget(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                          '${provider.resultsTopRated[index].backdropPath ?? ''}',
                          provider.resultsTopRated[index],
                          check),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFBB3B),
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${provider.resultsTopRated[index].voteAverage}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      provider.resultsTopRated[index].title ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      provider.resultsTopRated[index].releaseDate ?? '',
                      style: const TextStyle(
                          color: Color(0xffB5B4B4), fontSize: 10),
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
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 8,
          );
        },
      );
    });
  }
}
