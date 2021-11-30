
class Cmodel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Cmodel({this.postId, this.id, this.name, this.email, this.body});

  Cmodel.fromJson(Map<String, dynamic> json) {
    if(json["postId"] is int)
      this.postId = json["postId"];
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["body"] is String)
      this.body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["postId"] = this.postId;
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["body"] = this.body;
    return data;
  }
}