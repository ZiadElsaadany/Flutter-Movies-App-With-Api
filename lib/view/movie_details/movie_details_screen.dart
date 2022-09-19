import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import '../../model/movie_details/Genres.dart';
import '../main_movies/top_rated/top_rated_widget.dart';

class MovieDetailsView extends StatefulWidget {
  final int id;

  MovieDetailsView(this.id);

  static const String routeName = 'MovieDetails';

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<ApiManager>(context, listen: false)
          .getMoviesDetails(widget.id);
      Provider.of<ApiManager>(context, listen: false)
          .getSimilarMovies(1, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Provider.of<ApiManager>(context).movieDetails != null
            ? Text(Provider.of<ApiManager>(context).movieDetails!.title ?? '')
            : const Text('title'),
      ),
      body: Provider.of<ApiManager>(context).isLoadingMovieDetails == true
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.orange,
            ))
          : Consumer<ApiManager>(builder: (context, provider, _) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      placeholder: 'assets/loadingPicture.jpg',
                      image:provider.movieDetails!=null?
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                          '${provider.movieDetails!.backdropPath}':'',
                      imageErrorBuilder: (c, e, r) => Image.asset(
                        'assets/loadingPicture.jpg',
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 10, bottom: 5),
                        child: Text(
                          provider.movieDetails != null
                              ? provider.movieDetails!.title.toString()
                              : 'title',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                        child: Text(
                          provider.movieDetails != null
                              ? provider.movieDetails!.releaseDate.toString()
                              : 'date',
                          style: const TextStyle(
                              color: Color(0xffB5B4B4), fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: Stack(
                                  children: [
                                    FadeInImage.assetNetwork(
                                        fit: BoxFit.fill,
                                        placeholder:
                                            'assets/loadingPicture.jpg',
                                        image: provider.movieDetails != null
                                            ? 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                                                '${provider.movieDetails!.backdropPath}'
                                            : ''),
                                    const Image(
                                      image: AssetImage(
                                          'assets/image/Group24.png'),
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 3.0, left: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          provider.movieDetails != null
                                              ? provider.movieDetails!.overview
                                                  .toString()
                                              : 'overView',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xffFFBB3B),
                                          ),
                                          Text(
                                            provider.movieDetails != null
                                                ? provider
                                                    .movieDetails!.voteAverage
                                                    .toString()
                                                : 'Vote',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xff282A28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'More Like This',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (provider.resultsSimilar.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: ListView.separated(
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailsView(provider
                                                      .resultsSimilar[index].id!
                                                      .toInt())));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      decoration:
                                          const BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 2,
                                            spreadRadius: 4),
                                      ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TopRatedWidget(
                                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                                              '${provider.resultsSimilar[index].backdropPath}',
                                              provider.resultsSimilar[index]),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                '${provider.resultsSimilar[index].voteAverage!.round()}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            provider.resultsSimilar[index]
                                                    .title ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            provider.resultsSimilar[index]
                                                    .releaseDate ??
                                                '',
                                            style: const TextStyle(
                                                color: Color(0xffB5B4B4),
                                                fontSize: 10),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: provider.resultsSimilar.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (ctx, index) {
                                  return const SizedBox(
                                    width: 15,
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }),
    );
  }
}
