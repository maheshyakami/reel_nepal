class NewsModel {
  int newsId;
  String title;
  String refinedContent;
  String fullContent;
  String publishedDate;
  String publishedDateBS;
  String photoName;
  List<MovieTags> movieTags;

  NewsModel(
      {this.newsId,
      this.title,
      this.refinedContent,
      this.fullContent,
      this.publishedDate,
      this.publishedDateBS,
      this.photoName,
      this.movieTags});

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    title = json['title'];
    refinedContent = json['refinedContent'];
    fullContent = json['fullContent'];
    publishedDate = json['publishedDate'];
    publishedDateBS = json['publishedDateBS'];
    photoName = json['photoName'];

    if (json['movieTags'] != null) {
      movieTags = new List<MovieTags>();
      json['movieTags'].forEach((v) {
        movieTags.add(new MovieTags.fromJson(v));
      });
    }
  }
}

class MovieTags {
  int newsId;
  int movieId;
  String name;
  String urlTitle;
  String coverPhoto;

  MovieTags(
      {this.newsId, this.movieId, this.name, this.urlTitle, this.coverPhoto});

  MovieTags.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    movieId = json['movieId'];
    name = json['name'];
    urlTitle = json['urlTitle'];
    coverPhoto = json['coverPhoto'];
  }
}
