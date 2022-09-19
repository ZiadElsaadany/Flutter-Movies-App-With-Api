import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import 'movies_search.dart';
import 'search_widget.dart';

class MovieTestSearch extends StatefulWidget {
  const MovieTestSearch({Key? key}) : super(key: key);

  @override
  State<MovieTestSearch> createState() => _MovieTestSearchState();
}

class _MovieTestSearchState extends State<MovieTestSearch> {

  String q ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 5,left: 20,right: 20),
            child: Consumer<ApiManager>(builder: (context, provider, _) {
              return Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white)
                      ),
                      enabled: true,
                    ),
                    onChanged: (value){
                      if(value!=null && value.isNotEmpty){
                        q=value;
                        provider.searchMovies(q);
                      }

                    },
                    onFieldSubmitted: (value){
                      if(value!=null && value.isNotEmpty){
                        q=value;
                        provider.searchMovies(q);
                      }

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (provider.searchMoviesLoading)
                    const SizedBox(
                      height: 250,
                      child:  Center(
                        child: CircularProgressIndicator(
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  if(provider.resultsSearch.isNotEmpty)
              Expanded(
              child: ListView.separated(itemBuilder: (ctx, index) =>
              SearchView(
              title: Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].title ?? '',
              img: Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].backdropPath ?? '',
              date:
              DateTime
                  .tryParse(Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].releaseDate.toString())!=null?DateTime
                  .tryParse(Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].releaseDate.toString())
                  !.year.toString():Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].releaseDate.toString(),

              content: Provider
                  .of<ApiManager>(context)
                  .resultsSearch[index].voteAverage.toString()?? '',
                id: Provider.of<ApiManager>(context).resultsSearch[index].id!.toInt()
              ), separatorBuilder: (ctx, index) =>
              const Divider(
                color: Colors.white,
                thickness: 1.2,
                height: 15,

              ), itemCount: provider.resultsSearch.length
                        )),

                  if(provider.resultsSearch.isEmpty &&
                      provider.searchMoviesLoading == false)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Spacer(),
                          Image.asset(
                            'assets/image/drawable-xxxhdpi/Icon material-local-movies.png',
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'No Movies Found',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Spacer()
                        ],
                      ),
                    )
                ],
              );
            }),
          ),
        ));
  }
}
