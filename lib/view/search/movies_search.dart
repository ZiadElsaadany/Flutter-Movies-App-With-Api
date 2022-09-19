// import 'package:flutter/material.dart';
// import 'package:movies_app/api/api.dart';
// import 'package:movies_app/view/search/search_widget.dart';
// import 'package:provider/provider.dart';
//
// class MoviesSearch extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return  [
//       Container(
//         decoration: const BoxDecoration(
//           color: Colors.black
//         ),
//         child: IconButton(icon:const Icon( Icons.search,color: Colors.white,),
//           onPressed: ( ) {
//             Provider.of<ApiManager>(context,listen: false).resultsSearch=[];
//             Provider.of<ApiManager>(context,listen: false).searchMovies(query);
//             showResults(context);
//           } ,color: Colors.black,),
//       )
//     ] ;
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.black
//       ),
//       child: IconButton(onPressed: (){
//         Provider.of<ApiManager>(context,listen: false).resultsSearch=[];
//         Navigator.pop(context);
//       }, icon: const Icon(Icons.clear,color: Colors.white,), color: Colors.black,),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
// if( Provider.of<ApiManager>(context).searchMoviesLoading) {
//   return
//   const Center(child: CircularProgressIndicator(
//     color: Colors.yellow,
//   )) ;
// }
//
//  return ListView.builder(itemBuilder: (_,index){
//      return SearchView(
//        title: Provider.of<ApiManager>(context).resultsSearch[index].title??'',
//        img: Provider.of<ApiManager>(context).resultsSearch[index].backdropPath??'',
//        date:
//
//        DateTime.parse( Provider.of<ApiManager>(context).resultsSearch[index].releaseDate.toString()).year.toString()??'',
//        content:  Provider.of<ApiManager>(context).resultsSearch[index].title??'',
//      );
//    },
//      itemCount: Provider.of<ApiManager>(context).resultsSearch.length,
//    );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     Provider.of<ApiManager>(context,listen: false).resultsSearch = [] ;
//     if( Provider.of<ApiManager>(context).searchMoviesLoading) {
//       return
//         const Center(child: CircularProgressIndicator(
//           color: Colors.yellow,
//         )) ;
//     }
//    query.isNotEmpty?  Provider.of<ApiManager>(context,listen: false).searchMovies(query) :
//     null;
//
//    return ListView.builder(itemBuilder: (_,index) {
//       return SearchView(
//         title: Provider.of<ApiManager>(context).resultsSearch[index].title??'',
//         img: Provider.of<ApiManager>(context).resultsSearch[index].backdropPath??'',
//         date:
//        DateTime.parse( Provider.of<ApiManager>(context).resultsSearch[index].releaseDate.toString()).year.toString()??'',
//         content:  Provider.of<ApiManager>(context).resultsSearch[index].title??'',
//       );
//     },
//       itemCount: Provider.of<ApiManager>(context).resultsSearch.length,
//     );
//
//
//   }
//
// }