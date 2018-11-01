class ItemModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    parsedJson['results'].forEach((result) {
      _Result _result = _Result(result);
      _results.add(_result);
    });
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class _Result {
  int _voteCount;
  int _id;
  bool _video;
  var _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  _Result(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    result['genre_ids'].forEach((generId) {
      _genreIds.add(generId);
    });
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get release_date => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdropPath;

  List<int> get genre_ids => _genreIds;

  String get original_title => _originalTitle;

  String get original_language => _originalLanguage;

  String get poster_path => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get vote_average => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _voteCount;
}
