/// description : "These are the movies that I have watched over the years."
/// favorite_count : 0
/// id : 8207059
/// item_count : 2302
/// iso_639_1 : "en"
/// list_type : "movie"
/// name : "Movies Watched"
/// poster_path : null

class ResultsOfList {
  ResultsOfList({
      String? description, 
      num? favoriteCount, 
      num? id, 
      num? itemCount, 
      String? iso6391, 
      String? listType, 
      String? name, 
      dynamic posterPath,}){
    _description = description;
    _favoriteCount = favoriteCount;
    _id = id;
    _itemCount = itemCount;
    _iso6391 = iso6391;
    _listType = listType;
    _name = name;
    _posterPath = posterPath;
}

  ResultsOfList.fromJson(dynamic json) {
    _description = json['description'];
    _favoriteCount = json['favorite_count'];
    _id = json['id'];
    _itemCount = json['item_count'];
    _iso6391 = json['iso_639_1'];
    _listType = json['list_type'];
    _name = json['name'];
    _posterPath = json['poster_path'];
  }
  String? _description;
  num? _favoriteCount;
  num? _id;
  num? _itemCount;
  String? _iso6391;
  String? _listType;
  String? _name;
  dynamic _posterPath;
ResultsOfList copyWith({  String? description,
  num? favoriteCount,
  num? id,
  num? itemCount,
  String? iso6391,
  String? listType,
  String? name,
  dynamic posterPath,
}) => ResultsOfList(  description: description ?? _description,
  favoriteCount: favoriteCount ?? _favoriteCount,
  id: id ?? _id,
  itemCount: itemCount ?? _itemCount,
  iso6391: iso6391 ?? _iso6391,
  listType: listType ?? _listType,
  name: name ?? _name,
  posterPath: posterPath ?? _posterPath,
);
  String? get description => _description;
  num? get favoriteCount => _favoriteCount;
  num? get id => _id;
  num? get itemCount => _itemCount;
  String? get iso6391 => _iso6391;
  String? get listType => _listType;
  String? get name => _name;
  dynamic get posterPath => _posterPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = _description;
    map['favorite_count'] = _favoriteCount;
    map['id'] = _id;
    map['item_count'] = _itemCount;
    map['iso_639_1'] = _iso6391;
    map['list_type'] = _listType;
    map['name'] = _name;
    map['poster_path'] = _posterPath;
    return map;
  }

}