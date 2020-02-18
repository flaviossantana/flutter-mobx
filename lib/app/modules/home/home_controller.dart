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
    listAll.addAll(allist);
  }

  @action
  add(TodoModel model) async{
    if(model.isValid()){
      model = await storegeService.add(model);
      listAll.add(model);
    }
  }

  @observable
  ObservableList<TodoModel> listAll = ObservableList<TodoModel>();


}
