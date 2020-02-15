class TodoModel {
  int id;
  String title;
  bool check;

  TodoModel({
    this.id,
    this.title,
    this.check = false,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['check'] = this.check;
    return data;
  }
}
