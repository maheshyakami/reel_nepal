class VideoModel {
  int videoId;
  String title;
  String youTubeId;
  String publishedDate;
  String displayCategory;
  String description;

  VideoModel(
      {this.videoId,
      this.title,
      this.youTubeId,
      this.publishedDate,
      this.displayCategory,
      this.description});

  VideoModel.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    title = json['title'];
    youTubeId = json['youTubeId'];
    publishedDate = json['publishedDate'];
    displayCategory = json['displayCategory'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoId'] = this.videoId;
    data['title'] = this.title;
    data['youTubeId'] = this.youTubeId;
    data['publishedDate'] = this.publishedDate;
    data['displayCategory'] = this.displayCategory;
    data['description'] = this.description;
    return data;
  }
}
