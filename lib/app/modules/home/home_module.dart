import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermobx/app/modules/home/home_controller.dart';
import 'package:fluttermobx/app/modules/home/home_page.dart';
import 'package:fluttermobx/app/shared/services/local_storege_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(LocalStoregeService())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
