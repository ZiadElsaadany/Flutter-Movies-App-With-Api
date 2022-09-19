
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/model/categories/Genr.dart';
import 'package:movies_app/model/movie_details/Genres.dart';
import 'package:movies_app/model/movie_details/Movie_details.dart';
import 'package:movies_app/model/movie_list/Movies_list.dart';
import 'package:movies_app/model/movie_list/Results.dart';
import 'package:movies_app/model/popular/Popular_movies.dart';
import 'package:movies_app/model/similar/Similar_movies.dart';
import 'package:movies_app/model/top_rated/Top_rated.dart';
import '../model/popular/Results.dart';

class ApiManager extends ChangeNotifier {

  int currentIndex = 0;

  List<Results> results = [];

  List<Results> resultsTopRated = [];

  List<Results> resultsSimilar = [];

  bool isLoadingPopular = false;
  bool isLoadingTopRated = false;
  bool isLoadingMovieDetails = false;
  bool isLoadingSimilarDetails = false;
  static const String baseUrl = 'api.themoviedb.org';

  PopularMovies? popularMovies;

  TopRated ? topRated;

  MovieDetails ? movieDetails;

  SimilarMovies ? similarMovies;

  getPopularMovies(int page) async {
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

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        popularMovies = PopularMovies.fromJson(json.decode(response.body));
        results.addAll(popularMovies!.results ?? []);
        print('yes yes yes');

        isLoadingPopular = false;
        notifyListeners();
      } else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingPopular = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      isLoadingPopular = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      isLoadingPopular = false;
      notifyListeners();
    }
    notifyListeners();
  }

  getTopRatedMovies(int page) async {
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

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        topRated = TopRated.fromJson(json.decode(response.body));
        resultsTopRated.addAll(topRated!.results ?? []);
        print('yes yes yes');
        isLoadingTopRated = false;
        notifyListeners();
      }
      else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingTopRated = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      isLoadingTopRated = false;
      notifyListeners();
    }
    // catch(e) {
    //   print(e.toString());
    //   getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة' , Colors.red);
    //   isLoadingTopRated = false;
    //   notifyListeners();
    // }

    notifyListeners();
  }

  getMoviesDetails(int movieId) async {
    movieDetails = null;
    notifyListeners();
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

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        movieDetails = MovieDetails.fromJson(json.decode(response.body));
        print('yes yes yes');
        isLoadingMovieDetails = false;
        notifyListeners();
      }
      else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingMovieDetails = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      isLoadingMovieDetails = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      isLoadingMovieDetails = false;
      notifyListeners();
    }

    notifyListeners();
  }

  getSimilarMovies(int page, int movieId) async {
    if (page == 1) {
      similarMovies = null;
      resultsSimilar = [];
    }
    isLoadingSimilarDetails = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3/movie/$movieId/similar',

          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
            'page': '$page',
          }

      ); //   1

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        similarMovies = SimilarMovies.fromJson(json.decode(response.body));
        resultsSimilar.addAll(similarMovies!.results ?? []);
        print('yes yes yes');
        print('Smiller : $resultsSimilar');
        isLoadingSimilarDetails = false;
        notifyListeners();
      } else {
        getFlutterToast('no data in similar', Colors.red);
        print('======>>>>S : ${json.decode(response.body)}');
        print(json.decode(response.body)['status_message'].toString());
        isLoadingSimilarDetails = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      isLoadingSimilarDetails = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      isLoadingSimilarDetails = false;
      notifyListeners();
    }

    notifyListeners();
  }

  bool getLatestMoviesLoading = false;
  Results? latestResults;

  getLatestMovies() async {
    getLatestMoviesLoading = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3/movie/latest',
          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
          }

      ); //   1

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        latestResults = Results.fromJson(json.decode(response.body));
        print('yes yes yes');
        getLatestMoviesLoading = false;
        notifyListeners();
      } else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        getLatestMoviesLoading = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      getLatestMoviesLoading = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      getLatestMoviesLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  bool searchMoviesLoading = false;
  List<Results> resultsSearch = [];

  PopularMovies ?searchMovie;

  searchMovies(String query) async {
    resultsSearch = [];
    searchMoviesLoading = true;
    notifyListeners();

    try {
      var url = Uri.https(
          baseUrl,
          '3/search/movie',
          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
            'query': query
          }

      ); //   1

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        searchMovie = PopularMovies.fromJson(json.decode(response.body));
        resultsSearch.addAll(searchMovie!.results ?? []);
        print('yes yes yes');
        searchMoviesLoading = false;
        notifyListeners();
      } else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        searchMoviesLoading = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      searchMoviesLoading = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      searchMoviesLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  bool genresLoading = false;



  List<Genres>genresResults = []  ;
  Genr ?  genresObject;
  getGenresMovies() async {
    genresLoading = true;
    try {var url = Uri.https(
          baseUrl,
          '3/genre/movie/list',
          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
          }

      ); //   1
      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
       genresObject= Genr.fromJson(json.decode(response.body));
       genresResults= genresObject!.genres??[];
       notifyListeners();
       print (genresResults.length);
          genresLoading = false;
        notifyListeners();
      } else {
        getFlutterToast('no data in genres', Colors.red);
        print(json.decode(response.body)['status_message']);
        genresLoading = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      genresLoading = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      genresLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
  List<Results> watchListt = [];
  getWatchList(Results results) {
    watchListt.add(results);
    notifyListeners();
  }

  void checkWatchOrNot(bool check) {
    if (check == false) {
      check = true;
      notifyListeners();
    }
    notifyListeners();
  }


  MoviesList ? moviesList ;
  List<ResultsOfList>  resultsCategoryList = []  ;
  bool isLoadingCategoryList =false;
  getCategoryList(int movieId) async {
    moviesList = null;
    notifyListeners();
    isLoadingCategoryList = true;
    try {
      var url = Uri.https(
          baseUrl,
          '3//movie/$movieId/lists',
          {
            'api_key': '7aa09e7c4adae327e284850da455d2b0',
          }
      ); //   1

      http.Response response = await http.get(url); // 2

      if (response.statusCode == 200) {
        moviesList = MoviesList.fromJson(json.decode(response.body));
        resultsCategoryList.addAll(moviesList!.results??[]);
        print('yes yes yes');
        isLoadingCategoryList = false;
        notifyListeners();
      }
      else {
        getFlutterToast('no data', Colors.red);
        print(json.decode(response.body)['status_message']);
        isLoadingCategoryList = false;
        notifyListeners();
      }
    } on SocketException {
      getFlutterToast('no internet', Colors.red);
      isLoadingCategoryList = false;
      notifyListeners();
    }
    catch (e) {
      print(e.toString());
      getFlutterToast('حدث خطأ غير متوقع برجاء اعادة المحاولة', Colors.red);
      isLoadingCategoryList = false;
      notifyListeners();
    }

    notifyListeners();
  }

}