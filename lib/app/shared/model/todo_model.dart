import 'package:mobx/mobx.dart';

part 'todo_model.g.dart';

class TodoModel extends _TodoModel with _$TodoModel {
  TodoModel({
    int id,
    String title,
    bool check = false,
  }) : super(
          id: id,
          title: title,
          check: check,
        );

  TodoModel.fromJson(Map<dynamic, dynamic> json) {
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

  isValid() {
    return this.title != null && this.title.length > 0;
  }
}

abstract class _TodoModel with Store {
  int id;

  @observable
  String title;

  @observable
  bool check;

  _TodoModel({
    this.id,
    this.title,
    this.check = false,
  });
}
