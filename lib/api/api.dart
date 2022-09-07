
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/model/movie_details/Genres.dart';
import 'package:movies_app/model/movie_details/Movie_details.dart';
import 'package:movies_app/model/popular/Popular_movies.dart';
import 'package:movies_app/model/similar/Similar_movies.dart';
import 'package:movies_app/model/top_rated/Top_rated.dart';
import '../model/popular/Results.dart';

class ApiManager extends ChangeNotifier{
  List<Results>  results =[] ;
  List<Results>  resultsTopRated =[] ;
  List<Results>  resultsSimilar =[] ;
  List<Genres>  genres =[] ;
  num ? movieID ;
  bool isLoadingPopular = false;
  bool isLoadingTopRated = false;
  bool isLoadingMovieDetails = false;
  bool isLoadingSimilarDetails = false;
  static const String baseUrl = 'api.themoviedb.org' ;
 PopularMovies?  popularMovies ;
 TopRated ? topRated ;
 MovieDetails ?  movieDetails ;
 SimilarMovies ? similarMovies ;
   getPopularMovies( int page)async{
     isLoadingPopular = true;
try {
  var url = Uri.https(
      baseUrl,
      '3/movie/popular',

      {
        'api_key': '7aa09e7c4adae327e284850da455d2b0',
        'page': '$page'
      }

      ); //   1

  http.Response response =await  http.get(url); // 2

  if(response.statusCode == 200){
 popularMovies = PopularMovies.fromJson(json.decode(response.body));
    results.addAll(popularMovies!.results??[]);
    print ('yes yes yes') ;

    isLoadingPopular = false;
    notifyListeners();
  }else{
    getFlutterToast('no data' , Colors.red);
    print(json.decode(response.body)['status_message']);
    isLoadingPopular = false;
    notifyListeners() ;
  }
}on SocketException{
  getFlutterToast('no internet' , Colors.red);
  isLoadingPopular = false;
  notifyListeners();

}
catch(e) {
  print(e.toString());
  getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة' , Colors.red);
  isLoadingPopular = false;
  notifyListeners();
}

notifyListeners();
 }
   getTopRatedMovies( int page)async{
    isLoadingTopRated = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3/movie/top_rated',

          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
            'page': '$page'
          }

      ); //   1

      http.Response response =await  http.get(url); // 2

      if(response.statusCode == 200){
        topRated = TopRated.fromJson(json.decode(response.body));
        resultsTopRated.addAll(topRated!.results??[]);
        print ('yes yes yes') ;

        isLoadingTopRated = false;
        notifyListeners();
      }else{
        getFlutterToast('no data' , Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingTopRated = false;
        notifyListeners() ;
      }
    }on SocketException{
      getFlutterToast('no internet' , Colors.red);
      isLoadingTopRated = false;
      notifyListeners();

    }
    catch(e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة' , Colors.red);
      isLoadingTopRated = false;
      notifyListeners();
    }

    notifyListeners();
  }
   getMoviesDetails( num movieId)async{
     isLoadingMovieDetails = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3/movie/$movieId',

          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
            'movie_id': '$movieId'
          }

      ); //   1

      http.Response response =await  http.get(url); // 2

      if(response.statusCode == 200){
        movieDetails = MovieDetails.fromJson(json.decode(response.body));
        genres.addAll(movieDetails!.genres??[]);
        print ('yes yes yes') ;

        isLoadingMovieDetails = false;
        notifyListeners();
      }else{
        getFlutterToast('no data' , Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingMovieDetails = false;
        notifyListeners() ;
      }
    }on SocketException{
      getFlutterToast('no internet' , Colors.red);
      isLoadingMovieDetails = false;
      notifyListeners();

    }
    catch(e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة' , Colors.red);
      isLoadingMovieDetails = false;
      notifyListeners();
    }

    notifyListeners();
  }

  getSimilarMovies( int page, num movieId)async{
    isLoadingSimilarDetails = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3/movie/$movieID/similar',

          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
            'page': '$page'
          }

      ); //   1

      http.Response response =await  http.get(url); // 2

      if(response.statusCode == 200){
        similarMovies = SimilarMovies.fromJson(json.decode(response.body));
        resultsSimilar.addAll(similarMovies!.results??[]);
        print ('yes yes yes') ;

        isLoadingSimilarDetails = false;
        notifyListeners();
      }else{
        getFlutterToast('no data' , Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingSimilarDetails = false;
        notifyListeners() ;
      }
    }on SocketException{
      getFlutterToast('no internet' , Colors.red);
      isLoadingSimilarDetails = false;
      notifyListeners();

    }
    catch(e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة' , Colors.red);
      isLoadingSimilarDetails = false;
      notifyListeners();
    }

    notifyListeners();
  }



}