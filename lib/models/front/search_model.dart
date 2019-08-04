class SearchModel {
  int id;
  String name;
  String urlTitle;
  String details;
  String searchThumb;
  String category;

  SearchModel(
      {this.id,
      this.name,
      this.urlTitle,
      this.details,
      this.searchThumb,
      this.category});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    urlTitle = json['urlTitle'];
    details = json['details'];
    searchThumb = json['searchThumb'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['urlTitle'] = this.urlTitle;
    data['details'] = this.details;
    data['searchThumb'] = this.searchThumb;
    data['category'] = this.category;
    return data;
  }
}
