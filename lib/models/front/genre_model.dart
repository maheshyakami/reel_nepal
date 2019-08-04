class GenreModel {
  int id;
  String genreName;

  GenreModel({this.id, this.genreName});

  GenreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genreName = json['genreName'];
  }
}
