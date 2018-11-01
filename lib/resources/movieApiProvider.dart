import 'dart:convert';

import 'package:flutter_rxdart_app/constants/constants.dart';
import 'package:flutter_rxdart_app/models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get(Constants.popularMoviesUrl);
    if (response.statusCode == Constants.SUCCESS_STATUS_CODE) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed during API call');
    }
  }
}
