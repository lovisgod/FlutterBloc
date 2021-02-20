import 'dart:async';

import 'package:apiboss/model/response.dart';
import 'package:apiboss/networking/Response.dart';
import 'package:apiboss/repository/ChuckRepository.dart';

class ChuckBloc {
  ChuckRepository _chuckRepository;
  StreamController _chuckDataController;

  // ChuckBloc(String selectedCategory);

  StreamSink<Response<chukResponse>> get chuckDataSink =>
      _chuckDataController.sink;

  Stream<Response<chukResponse>> get chuckDataStream =>
      _chuckDataController.stream;

  ChuckBloc(String category) {
    _chuckDataController = StreamController<Response<chukResponse>>();
    _chuckRepository = ChuckRepository();
    fetchChuckyJoke(category);
  }

  fetchChuckyJoke(String category) async {
    chuckDataSink.add(Response.loading('Getting A Chucky Joke!'));
    try {
      chukResponse chuckJoke = await _chuckRepository.fetchChuckJoke(category);
      chuckDataSink.add(Response.completed(chuckJoke));
    } catch (e) {
      chuckDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckDataController?.close();
  }
}