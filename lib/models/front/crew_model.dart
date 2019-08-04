import 'package:reel_nepal/models/front/movie_model.dart';
import 'package:reel_nepal/models/front/video_model.dart';

import 'news_model.dart';

class CrewModel {
  int crewId;
  String crewName;
  String name;
  String nameNepali;
  String gender;
  String dob;
  bool hasBiography;
  String miniBio;
  String fullBio;
  String profilePhoto;
  String designation;
  List<MovieModel> filmography;
  String roleName;
  bool isVerified;
  List<VideoModel> topVideos;
  List<NewsModel> topNews;

  CrewModel(
      {this.crewId,
      this.crewName,
      this.name,
      this.nameNepali,
      this.gender,
      this.dob,
      this.hasBiography,
      this.miniBio,
      this.fullBio,
      this.profilePhoto,
      this.designation,
      this.filmography,
      this.roleName,
      this.isVerified,
      this.topVideos,
      this.topNews});

  CrewModel.fromJson(Map<String, dynamic> json) {
    crewId = json['crewId'];
    crewName = json['crewName'];
    name = json['name'];
    nameNepali = json['nameNepali'];
    gender = json['gender'];
    dob = json['dob'];
    hasBiography = json['hasBiography'];
    miniBio = json['miniBio'];
    fullBio = json['fullBio'];
    profilePhoto = json['profilePhoto'];
    designation = json['designation'];
    if (json['filmography'] != null) {
      filmography = List<MovieModel>();
      json['filmography'].forEach((v) {
        filmography.add(MovieModel.fromJson(v));
      });
    }
    roleName = json['roleName'];
    isVerified = json['isVerified'];
    if (json['topVideos'] != null) {
      topVideos = List<VideoModel>();
      json['topVideos'].forEach((v) {
        topVideos.add(VideoModel.fromJson(v));
      });
    }
    if (json['topNews'] != null) {
      topNews = List<NewsModel>();
      json['topNews'].forEach((v) {
        topNews.add(NewsModel.fromJson(v));
      });
    }
  }
}
