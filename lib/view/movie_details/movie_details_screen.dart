import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:provider/provider.dart';

import '../../model/movie_details/Genres.dart';
import '../main_movies/top_rated/top_rated_widget.dart';

class MovieDetailsView extends StatelessWidget {
  static const String routeName = 'MovieDetails';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(args.title),
      ),
      body: Consumer<ApiManager>(builder: (context, provider, _) {
        return ListView(
          shrinkWrap: true,
            children: [
           SizedBox(
             height: 217,
             child: FadeInImage.assetNetwork(
         width: double.infinity,
         fit: BoxFit.cover,
         placeholder: 'assets/linkedinPicture2.jpg',
         image: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
             '${args.img}',
             ),
           ),
           SizedBox(
             height: 100,
             child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 5),
             child: Text(
               args.title,
               style: const TextStyle(color: Colors.white, fontSize: 18),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 15.0,bottom: 5),
             child: Text(
               args.date,
               style: const TextStyle(color: Color(0xffB5B4B4), fontSize: 13),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Row(
               children: [
                 Stack(
                   children: [
                     FadeInImage.assetNetwork(
                       width: 129,
                       height: 199,
                       fit: BoxFit.fill,
                       placeholder: 'assets/linkedinPicture2.jpg',
                       image: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                           '${args.img}',
                     ),
                     const Image(image: AssetImage('assets/image/Group24.png'),height: 50,)
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 3.0,left: 8),
                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SingleChildScrollView(
                           child: SizedBox(
                               width: MediaQuery.of(context).size.width*0.6,
                               child: Text(args.overView, style: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 14
                               ),)),
                         ),
                         Row(
                           children: [
                             Icon ( Icons.star,color: Color(0xffFFBB3B),) ,
                             Text('${args.voteAverage}',style: TextStyle(
                                 color: Colors.white
                             ),)
                           ],
                         ),

                       ]
                   ),
                 )],
             ),
           ),
         ],
             ),
           ),


           ListView.separated(itemBuilder:  (ctx, index) {
          return Container(
            height: 100,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 4
                ),
              ]
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopRatedWidget(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                  '${provider.resultsSimilar[index].backdropPath ?? ''}'),
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
                  Text('${provider.resultsSimilar[index].voteAverage}',
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),

                ],
              ),
              Text(provider.resultsSimilar[index].title??'',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10
                ),

              ),
              Text(provider.resultsSimilar[index].releaseDate??'',
                style: const TextStyle(
                    color: Color(0xffB5B4B4),
                    fontSize: 10
                ),
                textAlign: TextAlign.start,

              ),
            ],
            ),
          );
        },
          itemCount: provider.resultsSimilar.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (ctx,index){
            return const SizedBox(
            width: 15,
            );
          },


        )


            ],
          );
      }),
    );
  }
}

class MovieModel {
  String img;
  String title;
  String date;
  static String img2 = 'assets/image/Group24.png';
  String overView;
  static Icon icon = Icon(
    Icons.star,
    color: Color(0xffFFBB3B),
  );
  num voteAverage;
  List<Genres> geners;
  MovieModel(
      {required this.title,
      required this.voteAverage,
      required this.img,
      required this.date,
      required this.geners,
      required this.overView});
}
