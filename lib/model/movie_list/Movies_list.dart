

import 'package:movies_app/model/movie_list/Results.dart';

class MoviesList {
  MoviesList({
      num? id, 
      num? page, 
      List<ResultsOfList>? results,
      num? totalPages, 
      num? totalResults,}){
    _id = id;
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  MoviesList.fromJson(dynamic json) {
    _id = json['id'];
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(ResultsOfList.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _id;
  num? _page;
  List<ResultsOfList>? _results;
  num? _totalPages;
  num? _totalResults;
MoviesList copyWith({  num? id,
  num? page,
  List<ResultsOfList>? results,
  num? totalPages,
  num? totalResults,
}) => MoviesList(  id: id ?? _id,
  page: page ?? _page,
  results: results ?? _results,
  totalPages: totalPages ?? _totalPages,
  totalResults: totalResults ?? _totalResults,
);
  num? get id => _id;
  num? get page => _page;
  List<ResultsOfList>? get results => _results;
  num? get totalPages => _totalPages;
  num? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}