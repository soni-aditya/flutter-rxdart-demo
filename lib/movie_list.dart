import 'package:flutter/material.dart';
import 'package:flutter_rxdart_app/bloc/movies_bloc.dart';
import 'package:flutter_rxdart_app/constants/constants.dart';
import 'package:flutter_rxdart_app/models/item_model.dart';

class MovieList extends StatelessWidget {
  MoviesBloc bloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot);
          }
        },
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          Constants.getPoster(snapshot.data.results[index].posterPath),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
