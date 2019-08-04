import 'package:reel_nepal/models/front/front_data_model.dart';
import 'package:reel_nepal/services/http_service.dart';

import '../singletons.dart';

class FrontDataService {
  Future<FrontDataModel> getFrontData() async {
    dynamic result = await singletons<HttpService>().fetch('Front/');
    return FrontDataModel.fromJson(result);
  }

  /*Future<List<MovieModel>> getFeaturedMovies() async {
    List<dynamic> result = await singletons<HttpService>().fetch(path);
    var response = await HttpService().get("Front");
    List<dynamic> rawMovies = response.result['featuredMovies'];
    return rawMovies.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<List<NewsModel>> getTopNews() async {
    var response = await HttpService().get("Front");
    List<dynamic> rawNews = response.result['topNews'];
    return rawNews.map((news) => News.fromJson(news)).toList();
  }

  Future<List<VideoModel>> getTopVideos() async {
    var response = await HttpService().get("Front");
    List<dynamic> rawVideo = response.result['topVideos'];
    return rawVideo.map((video) => Video.fromJson(video)).toList();
  }

  */
}
