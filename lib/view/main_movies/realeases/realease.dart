import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../movie_details/movie_details_screen.dart';
import '../top_rated/top_rated_widget.dart';

class ReleaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiManager>(builder: (context, provider, _) {
      return ListView.separated(
        itemBuilder: (ctx, index) {
          return Container(
            height:MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 2, spreadRadius: 4),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: TopRatedWidget(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2'
                '${provider.results[index].backdropPath ?? ''}',
                provider.results[index],
            true,
            ),
          );
        },
        itemCount: provider.results.length,
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
