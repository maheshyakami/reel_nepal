import 'package:reel_nepal/models/front/video_model.dart';

import 'movie_model.dart';
import 'news_model.dart';

class FrontDataModel {
  List<MovieModel> featuredMovies;
  List<MovieModel> thisWeekMovies;
  List<MovieModel> nextWeekMovies;
  List<NewsModel> topNews;
  List<VideoModel> topVideos;

  FrontDataModel(
      {this.featuredMovies,
      this.thisWeekMovies,
      this.nextWeekMovies,
      this.topNews,
      this.topVideos});

  FrontDataModel.fromJson(Map<String, dynamic> json) {
    if (json['featuredMovies'] != null) {
      featuredMovies = List<MovieModel>();
      json['featuredMovies'].forEach((v) {
        featuredMovies.add(MovieModel.fromJson(v));
      });
    }
    if (json['thisWeekMovies'] != null) {
      thisWeekMovies = List<MovieModel>();
      json['thisWeekMovies'].forEach((v) {
        thisWeekMovies.add(MovieModel.fromJson(v));
      });
    }
    if (json['nextWeekMovies'] != null) {
      nextWeekMovies = List<MovieModel>();
      json['nextWeekMovies'].forEach((v) {
        nextWeekMovies.add(MovieModel.fromJson(v));
      });
    }
    if (json['topNews'] != null) {
      topNews = List<NewsModel>();
      json['topNews'].forEach((v) {
        topNews.add(NewsModel.fromJson(v));
      });
    }
    if (json['topVideos'] != null) {
      topVideos = List<VideoModel>();
      json['topVideos'].forEach((v) {
        topVideos.add(VideoModel.fromJson(v));
      });
    }
  }
}
