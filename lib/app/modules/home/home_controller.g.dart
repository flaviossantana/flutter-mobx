// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$listAllAtom = Atom(name: '_HomeBase.listAll');

  @override
  ObservableList<TodoModel> get listAll {
    _$listAllAtom.context.enforceReadPolicy(_$listAllAtom);
    _$listAllAtom.reportObserved();
    return super.listAll;
  }

  @override
  set listAll(ObservableList<TodoModel> value) {
    _$listAllAtom.context.conditionallyRunInAction(() {
      super.listAll = value;
      _$listAllAtom.reportChanged();
    }, _$listAllAtom, name: '${_$listAllAtom.name}_set');
  }

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future add(TodoModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  @override
  String toString() {
    final string = 'listAll: ${listAll.toString()}';
    return '{$string}';
  }
}
