import 'package:flutter_rxdart_app/models/item_model.dart';
import 'package:flutter_rxdart_app/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
