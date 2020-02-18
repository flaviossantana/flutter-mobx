import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/app/modules/home/home_module.dart';
import 'package:fluttermobx/app/shared/model/todo_model.dart';

import 'components/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key key,
    this.title = "Mobx|TODO",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeModule.to.get<HomeController>();

  _showDialog([TodoModel model]) {
    model = model ?? TodoModel();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("TODO"),
          content: TextFormField(
            onChanged: (valor) {
              model.title = valor;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Salvar"),
              onPressed: () {
                _controller.add(model);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: _controller.listAll.length,
            itemBuilder: (context, index) {
              TodoModel model = _controller.listAll[index];
              return ItemWidget(
                model: model,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }
}
