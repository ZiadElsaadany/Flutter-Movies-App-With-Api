import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/view/main_movies/top_rated/top_rated_view.dart';
import 'package:provider/provider.dart';

import '../../movie_details/movie_details_screen.dart';
import '../realeases/realease.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      if (provider.isLoadingPopular && provider.isLoadingTopRated) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      } else {
        return (provider.results.isNotEmpty)
            ? ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.36,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailsView(
                                    provider.results[12].id!.toInt())));
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.3,
                                child: FadeInImage.assetNetwork(
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/loadingPicture.jpg',
                                  image:
                                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                                      '${provider.results[12].backdropPath ?? ''}',
                                  imageErrorBuilder: (x,c,v)=>Image.asset('assets/linkedinPicture2.jpg',fit: BoxFit.fill,),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 100.0),
                                      child: Text(
                                        provider.results[12].title ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        provider.results[12].releaseDate ?? '',
                                        style: const TextStyle(
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
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MediaQuery.of(context).size.height*0.20,
                              width: MediaQuery.of(context).size.width*0.34,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                placeholder: 'assets/loadingPicture.jpg',
                                image:
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${provider.results[12].backdropPath ?? ''}',
                                imageErrorBuilder:
                                    (x,c,v)=>Image.asset('assets/loadingPicture.jpg',fit: BoxFit.fill,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xff282A28),
                    ),
                    child: const Text(
                      'New Releases',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(color: Color(0xff282A28)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.2,
                      child: ReleaseScreen(),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xff282A28),
                    ),
                    child: const Text(
                      'Recommended',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(color: Color(0xff282A28)),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.3,
                      child: TopRatedView(check: true,),
                    ),
                  ),
                ],
              )
            : const Text(
              'No data',
              style: TextStyle(color: Colors.white, fontSize: 20),
            );
      }
    });
  }
}
