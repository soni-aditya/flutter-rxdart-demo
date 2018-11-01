import 'package:flutter_rxdart_app/models/item_model.dart';
import 'package:flutter_rxdart_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();

  /// Subject <-> StreamController  => Listener
  final _moviesFetcher = PublishSubject<ItemModel>();

  /// Observable <-> Stream  => Output
  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  ///Input into stream  => Sink
  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  //Terminating the stream
  dispose() {
    _moviesFetcher.close();
  }
}
