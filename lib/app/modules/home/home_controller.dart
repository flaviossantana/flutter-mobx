import 'package:fluttermobx/app/shared/model/todo_model.dart';
import 'package:fluttermobx/app/shared/services/local_storege_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final LocalStoregeService storegeService;

  _HomeBase(this.storegeService){
    _init();
  }

  _init() async {
    final allist = await storegeService.getAll();
    list.addAll(allist);
  }

  @action
  add(TodoModel model) async{
    model = await storegeService.add(model);
    list.add(model);
  }

  @observable
  ObservableList<TodoModel> list = ObservableList<TodoModel>();


}
