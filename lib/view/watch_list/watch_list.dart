import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import '../search/search_widget.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Watchlist',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
         const SizedBox(height: 20,),
    if( Provider.of<ApiManager>(context).watchListt.isEmpty ||Provider.of<ApiManager>(context).watchListt==[] )
      Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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

            ],
          ),
        ),
      ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                  separatorBuilder: (ctx, index)=>const SizedBox(height: 5,),
                  itemCount: Provider.of<ApiManager>(context).watchListt.length,
                  itemBuilder: (context,index)=> SizedBox(
                      height: MediaQuery.of(context).size.height*0.2,
                      child: SearchView(
                        content:
                        Provider.of<ApiManager>(context).watchListt[index].voteAverage.toString(),
                        date:   DateTime
                            .tryParse(Provider
                            .of<ApiManager>(context)
                            .watchListt[index].releaseDate.toString())!=null?DateTime
                            .tryParse(Provider
                            .of<ApiManager>(context)
                            .watchListt[index].releaseDate.toString())
                        !.year.toString():Provider
                            .of<ApiManager>(context)
                            .watchListt[index].releaseDate.toString(),
                        img: Provider.of<ApiManager>(context).watchListt[index].backdropPath??'assets/loadingPicture.jpg',
                        title:Provider.of<ApiManager>(context).watchListt[index].title??'' ,
                        id: Provider.of<ApiManager>(context).watchListt[index].id!.toInt(),
                      )
                  )
              ),
            ),
          )

          ,
        ],
      ),
    ),
  );
  }
}
