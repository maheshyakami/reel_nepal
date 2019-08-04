import 'package:reel_nepal/models/front/movie_model.dart';

import '../singletons.dart';
import 'http_service.dart';

class MovieService {
  Future<MovieModel> getMovieById(int movieId) async {
    dynamic result = await singletons<HttpService>().fetch('movie/$movieId');
    return MovieModel.fromJson(result);
  }
}
