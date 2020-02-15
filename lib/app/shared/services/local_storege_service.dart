import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermobx/app/shared/model/todo_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStoregeService extends Disposable {
  Completer<Box> completer = Completer<Box>();

  LocalStoregeService() {
    _initDB();
  }

  _initDB() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = await Hive.openBox("todo");

    if (!completer.isCompleted) {
      completer.complete(box);
    }
  }

  box() async {
    //final box = await completer.future;
    return await completer.future;
  }

  Future<List<TodoModel>> getAll() async {
    return box()
        .values
        .map(
          (item) => TodoModel.fromJson(item),
        )
        .toList();
  }

  Future<TodoModel> add(TodoModel model) async {
    model.id = box().values.length;
    await box().put(model.id, model.toJson());
    return model;
  }

  remove(int id) async {
    await box().delete(id);
  }

  update(TodoModel model) async {
    await box().put(
      model.id,
      model.toJson(),
    );
  }

  @override
  void dispose() async {
    box().close();
  }
}
