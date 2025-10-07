import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:smaservicos/app/configs/modules/core_module.dart';
import 'package:smaservicos/app/configs/modules/todo_module.dart';
import 'package:smaservicos/app/ui/home/home_page.dart';

class HomeModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    TodoModule()
  ];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => HomePage(
      queryParams: Modular.args.queryParams), transition: TransitionType.leftToRight);

  }

}