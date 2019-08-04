import 'package:reel_nepal/models/front/crew_model.dart';
import 'package:reel_nepal/models/front/genre_model.dart';

import 'news_model.dart';

class MovieModel {
  int movieId;
  String name;
  String nameNepali;
  int runTime;
  String releaseDate;
  String coverPhoto;
  String synopsis;
  String censorCertificate;
  int movieStatusId;
  double rating;
  int ratingUser;
  int remainingDays;
  List<CrewModel> mainCasts;
  List<CrewModel> directors;
  List<CrewModel> writers;
  List<GenreModel> genres;
  List<CrewModel> casts;
  List<NewsModel> newsList;
  List<CrewModel> fullCrewList;

  MovieModel(
      {this.movieId,
      this.name,
      this.nameNepali,
      this.runTime,
      this.releaseDate,
      this.coverPhoto,
      this.synopsis,
      this.censorCertificate,
      this.movieStatusId,
      this.rating,
      this.ratingUser,
      this.remainingDays,
      this.mainCasts,
      this.directors,
      this.writers,
      this.genres,
      this.casts,
      this.newsList,
      this.fullCrewList});

  MovieModel.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    name = json['name'];
    nameNepali = json['nameNepali'];
    runTime = json['runTime'];
    releaseDate = json['releaseDate'];
    coverPhoto = json['coverPhoto'];
    synopsis = json['synopsis'];
    censorCertificate = json['censorCertificate'];
    movieStatusId = json['movieStatusId'];
    rating = json['rating'];
    ratingUser = json['ratingUser'];
    remainingDays = json['remainingDays'];
    if (json['mainCasts'] != null) {
      mainCasts = List<CrewModel>();
      json['mainCasts'].forEach((v) {
        mainCasts.add(CrewModel.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = List<CrewModel>();
      json['directors'].forEach((v) {
        directors.add(CrewModel.fromJson(v));
      });
    }
    if (json['writers'] != null) {
      writers = List<CrewModel>();
      json['writers'].forEach((v) {
        writers.add(CrewModel.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = List<GenreModel>();
      json['genres'].forEach((v) {
        genres.add(GenreModel.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = List<CrewModel>();
      json['casts'].forEach((v) {
        casts.add(CrewModel.fromJson(v));
      });
    }
    if (json['newsList'] != null) {
      newsList = List<NewsModel>();
      json['newsList'].forEach((v) {
        newsList.add(NewsModel.fromJson(v));
      });
    }
    if (json['fullCrewList'] != null) {
      fullCrewList = List<CrewModel>();
      json['fullCrewList'].forEach((v) {
        fullCrewList.add(CrewModel.fromJson(v));
      });
    }
  }
}
