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

  Future<List<TodoModel>> getAll() async {
    final box = await completer.future;
    return box. values.map((item) => TodoModel.fromJson(item)).toList();
  }

  Future<TodoModel> add(TodoModel model) async {
    final box = await completer.future;
    model.id = box.values.length;
    await box.put(model.id, model.toJson());
    return model;
  }

  remove(int id) async {
    final box = await completer.future;
    await box.delete(id);
  }

  update(TodoModel model) async {
    final box = await completer.future;
    await box.put(
      model.id,
      model.toJson(),
    );
  }

  @override
  void dispose() async {
    final box = await completer.future;
    box.close();
  }
}
