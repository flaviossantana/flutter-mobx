import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/app/shared/model/todo_model.dart';

class ItemWidget extends StatelessWidget {
  final TodoModel model;

  ItemWidget({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        title: Text(model.title),
        trailing: Checkbox(
          value: model.check,
          onChanged: (bool value) {
            model.check = value;
          },
        ),
      ),
    );
  }
}
