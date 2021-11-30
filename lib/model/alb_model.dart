
class AlbModel {
  int userId;
  int id;
  String title;

  AlbModel({this.userId, this.id, this.title});

  AlbModel.fromJson(Map<String, dynamic> json) {
    this.userId = json["userId"];
    this.id = json["id"];
    this.title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    return data;
  }
}